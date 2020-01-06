package com.zcc.log.service.impl;

import com.zcc.log.dao.LogDao;
import com.zcc.log.entity.LogEntity;
import com.zcc.log.service.LogService;
import org.springframework.stereotype.Service;

/**
 * @author zcc
 */
@Service("logService")
public class LogServiceImpl implements LogService {

    private final LogDao logDao;

    public LogServiceImpl(LogDao logDao) {
        this.logDao = logDao;
    }

    @Override
    public void save(LogEntity logEntity) {
        logDao.save(logEntity);
    }

    @Override
    public void update(LogEntity logEntity) {
        System.out.println(logEntity.getException());
    }
}
