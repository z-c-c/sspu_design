package com.zcc.log.common;

import com.zcc.log.entity.LogEntity;
import com.zcc.log.service.LogService;

/**
 * @author zcc
 * 保存日志的线程
 */
public class SaveLogThread implements Runnable {

    private LogEntity logEntity;

    private LogService logService;

    public SaveLogThread(LogEntity logEntity, LogService logService) {
        this.logEntity = logEntity;
        this.logService = logService;
    }

    public SaveLogThread() {
    }

    /**
     * When an object implementing interface <code>Runnable</code> is used
     * to create a thread, starting the thread causes the object's
     * <code>run</code> method to be called in that separately executing
     * thread.
     * <p>
     * The general contract of the method <code>run</code> is that it may
     * take any action whatsoever.
     *
     * @see Thread#run()
     */
    @Override
    public void run() {
        this.logService.save(this.logEntity);
    }
}
