package com.zcc.log.controller;

import com.zcc.commons.utils.ResultBean;
import com.zcc.commons.utils.TimeUtil;
import com.zcc.log.annotation.Log;
import com.zcc.log.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @author zcc
 */
@RestController
@RequestMapping("/logs")
public class LogController {

    @Autowired
    private LogService logService;

    @GetMapping("/log")
    public ResultBean find() {
        return ResultBean.success(logService.find(TimeUtil.getDayBefore(0), new Date()));
    }

    @GetMapping("/count")
    public ResultBean count() {
        return ResultBean.success(logService.countByDay(TimeUtil.getDayBefore(6), new Date()));
    }

}
