package com.zcc.log.common;

import com.zcc.log.entity.LogEntity;
import com.zcc.log.service.LogService;

/**
 * @author zcc
 * 更新日志的线程
 */
public class UpdateLogThread extends Thread {

    private LogEntity logEntity;
    private LogService logService;

    public UpdateLogThread(LogEntity logEntity, LogService logService) {
        this.logEntity = logEntity;
        this.logService = logService;
    }

    @Override
    public void run() {
        this.logService.update(logEntity);
    }
}
