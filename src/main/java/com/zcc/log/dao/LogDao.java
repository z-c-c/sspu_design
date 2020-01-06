package com.zcc.log.dao;

import com.zcc.log.entity.LogEntity;
import org.springframework.stereotype.Repository;

/**
 * @author zcc
 */
@Repository
public interface LogDao {

    /**
     * 保存日志
     * @param logEntity logEntity
     */
    void save(LogEntity logEntity);
}
