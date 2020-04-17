package com.zcc.commons.utils;

import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author zcc
 */
@Component("neo4jDataSource")
public class Neo4jConnectionPool {


    /**
     * 是否关闭
     */
    AtomicBoolean isClosed = new AtomicBoolean(false);


    /**
     * 空闲队列
     */
    LinkedBlockingQueue<Driver> idle;

    /**
     * 繁忙队列
     */
    LinkedBlockingQueue<Driver> busy;

    /**
     * 大小控制连接数量
     */
    AtomicInteger activeSize = new AtomicInteger(0);

    /**
     * 记录连接被创建的次数
     */
    AtomicInteger createCounter = new AtomicInteger(0);
    /**
     * 最小连接数
     */
    private Integer minActive;
    /**
     * 最大连接数
     */
    private Integer maxActive;
    /**
     * 最长连接时间
     */
    private Long maxWait;

    String neo4j_url = null;

    String neo4j_username = null;

    String neo4j_password = null;

    @PostConstruct
    public void init() {
        Properties config = new Properties();
        ClassPathResource neo4jProperties = new ClassPathResource("neo4j.properties");

        try {
            config.load(neo4jProperties.getInputStream());
            neo4j_url = config.getProperty("neo4j_url");
            neo4j_username = config.getProperty("neo4j_username");
            neo4j_password = config.getProperty("neo4j_password");
            maxActive = Integer.parseInt(config.getProperty("maxActive"));
            minActive = Integer.parseInt(config.getProperty("minActive"));
            maxWait = Long.parseLong(config.getProperty("maxWait"));
            if (!StringUtil.isValidStr(neo4j_url)) {
                System.err.println("没有找到neo4j连接地址");
            }
            if (!StringUtil.isValidStr(neo4j_username)) {
                System.err.println("没有找到neo4j连接账户");
            }
            if (!StringUtil.isValidStr(neo4j_password)) {
                System.err.println("没有找到neo4j连接密码");
            }
            if (maxActive < 1) {
                System.err.println("最大连接数不能小于1");
            }
            if (maxWait < 1) {
                System.err.println("等待时间不能小于0ms");
            }
            if (minActive < 0) {
                System.err.println("最小连接数不能小于0");
            }
            idle = new LinkedBlockingQueue<>(maxActive);
            busy = new LinkedBlockingQueue<>(maxActive);

            if (minActive > 0) {
                for (int i = 0; i < minActive; i++) {
                    try {
                        release(achieve());
                    } catch (Exception e) {
                        e.printStackTrace();
                        System.err.println("初始化连接失败");
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 创建连接
     *
     * @param url      url
     * @param username username
     * @param password password
     * @return
     */
    private Driver createNeo4jConnection(String url, String username, String password) {
        try {
            Driver driver = GraphDatabase.driver(url, AuthTokens.basic(username, password));
            if (driver != null) {
                return driver;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取连接
     *
     * @return
     */
    public Driver achieve() throws Exception {
        Driver driver = null;
        //获取连接的开始时间
        long now = System.currentTimeMillis();
        while (null == driver) {
            driver = idle.poll();
            //如果空闲队列里有连接,直接是被复用，再将此连接移动到busy （繁忙）队列中
            if (null != driver) {
                busy.offer(driver);
                return driver;
            } else {
                if (activeSize.get() < maxActive) {
                    if (activeSize.incrementAndGet() <= maxActive) {
                        driver = createNeo4jConnection(neo4j_url, neo4j_username, neo4j_password);
                        createCounter.incrementAndGet();
                        busy.offer(driver);
                        return driver;
                    } else {
                        //加完后超出大小再减回来
                        activeSize.decrementAndGet();
                    }
                }
            }

            //等待别人释放得到连接，同时也有最长的等待时间限制
            try {
                driver = idle.poll(maxWait - (System.currentTimeMillis() - now), TimeUnit.MILLISECONDS);
            } catch (Exception e) {
                throw new Exception("等待异常");
            }

            if (null == driver) {
                //判断是否超时
                if ((System.currentTimeMillis() - now) >= maxWait) {
                    throw new Exception("等待超时");
                } else {
                    continue;
                }
            } else {
                busy.offer(driver);
            }
        }
        return driver;
    }

    /**
     * 释放连接
     *
     * @param driver
     */
    public void release(Driver driver) {
        if (null == driver) {
            return;
        }
        if (busy.remove(driver)) {
            idle.offer(driver);
        } else {
            //如果释放不成功,则减去一个连接，在创建的时候可以自动补充
            activeSize.decrementAndGet();
        }
    }

    /**
     * 关闭连接
     *
     * @throws Exception
     */
    @SuppressWarnings("unUsed")
    private void close() throws Exception {
        if (isClosed.compareAndSet(false, true)) {
            LinkedBlockingQueue<Driver> pool = idle;
            while (pool.isEmpty()) {
                Driver drivers = pool.poll();
                drivers.close();
                //空闲连接关闭完成后关闭繁忙队列
                if (pool == idle && pool.isEmpty()) {
                    pool = busy;
                }
            }
        }
    }

    @Scheduled(cron = "0 0/1 * * * ?")
    private void closeUnUseConnection() {
        if (idle.size() == maxActive) {
            for (int i = minActive; i < idle.size(); i++) {
                Driver poll = idle.poll();
                poll.close();
            }
        }
    }

}

