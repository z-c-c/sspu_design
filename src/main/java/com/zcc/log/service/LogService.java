package com.zcc.log.service;

import com.zcc.log.entity.LogEntity;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author zcc
 */
public interface LogService {
    /**
     * 保存日志
     *
     * @param logEntity logEntity
     */
    void save(LogEntity logEntity);

    /**
     * 更新日志
     *
     * @param logEntity logEntity
     */
    void update(LogEntity logEntity);


    /**
     * 查找系统访问日志
     *
     * @param begin 开始时间
     * @param end   结束时间
     * @return list
     */
    List<LogEntity> find(Date begin, Date end);

    /**
     * 每天数量统计
     *
     * @param begin 开始时间 yyyy-MM-dd
     * @param end   结束时间 yyyy-MM-dd
     * @return
     */
    Map<String, Object> countByDay(Date begin, Date end);
}
