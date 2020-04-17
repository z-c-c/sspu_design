package com.zcc.log.service;

import com.zcc.log.entity.LogEntity;

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
}
