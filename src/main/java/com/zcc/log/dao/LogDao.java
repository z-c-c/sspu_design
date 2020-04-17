package com.zcc.log.dao;

import com.zcc.log.entity.LogEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author zcc
 */
@Repository
public interface LogDao {

    /**
     * 保存日志
     *
     * @param logEntity logEntity
     */
    void save(LogEntity logEntity);

    /**
     * 查找系统访问日志
     *
     * @param begin 开始时间 yyyy-MM-dd
     * @param end   结束时间 yyyy-MM-dd
     * @return list
     */
    List<LogEntity> find(@Param("begin") String begin, @Param("end") String end);

    /**
     * 每天数量统计
     *
     * @param begin 开始时间 yyyy-MM-dd
     * @param end   结束时间 yyyy-MM-dd
     * @return
     */
    List<Map> countByDay(@Param("begin") String begin, @Param("end") String end);
}
