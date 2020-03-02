package com.zcc.log.common;

import cn.hutool.core.thread.threadlocal.NamedThreadLocal;
import com.alibaba.fastjson.JSON;
import com.zcc.log.annotation.Log;
import com.zcc.log.entity.LogEntity;
import com.zcc.log.service.LogService;
import com.zcc.manager.usermanager.entity.UserInfoEntity;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

/**
 * @author zcc
 */
@Aspect
@Component
public class LogAspect {

    private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);

    private static final ThreadLocal<Date> BEGIN_TIME_THREAD_LOCAL =
            new NamedThreadLocal<Date>("ThreadLocal beginTime");
    private static final ThreadLocal<LogEntity> LOG_THREAD_LOCAL =
            new NamedThreadLocal<LogEntity>("ThreadLocal logEntity");

    private final HttpServletRequest request;

    private final ThreadPoolTaskExecutor threadPoolTaskExecutor;

    private final LogService logService;

    public LogAspect(HttpServletRequest request, ThreadPoolTaskExecutor threadPoolTaskExecutor, LogService logService) {
        this.request = request;
        this.threadPoolTaskExecutor = threadPoolTaskExecutor;
        this.logService = logService;
    }

    @Pointcut("@annotation(com.zcc.log.annotation.Log)")
    private void operationLog() {
    }

    /**
     * 前置通知，用于拦截Controller层记录用户的操作的开始时间
     */
    @Before("operationLog()")
    public void beforePrintLog(JoinPoint joinPoint) throws InterruptedException {
        Date beginTime = new Date();
        //线程绑定变量（该数据只有当前请求的线程可见）
        BEGIN_TIME_THREAD_LOCAL.set(beginTime);
        //这里日志级别为debug
        if (logger.isDebugEnabled()) {
//            logger.debug(" {}  访问接口: {}", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS")
//                    .format(beginTime), request.getRequestURI());
        }
        //注解中的name对应的值
        String name = getAnnotationName(joinPoint);
        //请求的IP
        String remoteAddr = request.getRemoteAddr();
        //请求的Uri
        String requestUri = request.getRequestURI();
        //请求的方法类型(post/get)
        String method = request.getMethod();
        //请求提交的参数
        Map<String, String[]> params = request.getParameterMap();
        String requestParams = "";
        if (params != null) {
            requestParams = JSON.toJSONString(params);
        }
        LogEntity logEntity = new LogEntity();
        logEntity.setName(name);
        logEntity.setRemoteAddr(remoteAddr);
        logEntity.setRequestUri(requestUri);
        logEntity.setMethod(method);
        logEntity.setParams(requestParams);
        logEntity.setOperateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(beginTime));
        LOG_THREAD_LOCAL.set(logEntity);

        HttpSession session = request.getSession();
        //读取session中的用户
        UserInfoEntity currentPerson = (UserInfoEntity)session.getAttribute("currentPerson");
        logEntity.setUserId(null);
        if(currentPerson!=null){
            logEntity.setUserId(currentPerson.getUserName());
        }
    }

    /**
     * @param point
     * @param returnValue
     * @param log
     */
    @AfterReturning(returning = "returnValue", pointcut = "operationLog() && @annotation(log)")
    public void doAfterReturning(JoinPoint point, Object returnValue, Log log) {
        //得到线程绑定的局部变量（开始时间）
        long beginTime = BEGIN_TIME_THREAD_LOCAL.get().getTime();
        //结束时间
        long endTime = System.currentTimeMillis();
        if (logger.isDebugEnabled()) {
//            logger.debug("{} 接口访问结束 URI: {}  耗时： {}mm   最大内存: {}m  已分配内存: {}m  已分配内存中的剩余空间: {}m  最大可用内存: {}m",
//                    new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(endTime),
//                    request.getRequestURI(),
//                    endTime - beginTime,
//                    Runtime.getRuntime().maxMemory() / 1024 / 1024,
//                    Runtime.getRuntime().totalMemory() / 1024 / 1024,
//                    Runtime.getRuntime().freeMemory() / 1024 / 1024,
//                    (Runtime.getRuntime().maxMemory() - Runtime.getRuntime().totalMemory() + Runtime.getRuntime().freeMemory()) / 1024 / 1024);
        }
        LogEntity logEntity = LOG_THREAD_LOCAL.get();
        logEntity.setEndTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(endTime));
        logEntity.setResult(LogEntity.SUCCESS);

        //这是在登陆的接口执行成功之后才能正确获取到登陆人
        HttpSession session = request.getSession();
        UserInfoEntity currentPerson = (UserInfoEntity)session.getAttribute("currentPerson");
        logEntity.setUserId(null);
        if(currentPerson!=null){
            logEntity.setUserId(currentPerson.getUserName());
        }

         // 通过线程池来执行日志保存
        //threadPoolT askExe  cu  to r.e x e c u te(new Save LogT hread(log Entity , logService));
        logService.save(logEntity);
        BEGIN_TIME_THREAD_LOCAL.remove();
        LOG_THREAD_LOCAL.remove();
    }


    /**
     * 异常通知 记录操作报错日志
     *
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(pointcut = "operationLog()", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Exception e) {
        LogEntity log = LOG_THREAD_LOCAL.get();
        log.setResult("error");
        log.setException(e.toString());
        long endTime = System.currentTimeMillis();
        log.setEndTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(endTime));

//        threadPoolTaskExecutor.execute(new SaveLogThread(log,logService));
        logService.save(log);
        BEGIN_TIME_THREAD_LOCAL.remove();
        LOG_THREAD_LOCAL.remove();
    }

    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     *
     * @param joinPoint 切点
     * @return name
     */
    public static String getAnnotationName(JoinPoint joinPoint) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        Log controllerLog = method
                .getAnnotation(Log.class);
        return controllerLog.name();
    }


}
