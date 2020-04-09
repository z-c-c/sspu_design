package com.zcc.platform.warning.controller;

import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.ResultBean;
import com.zcc.exceptions.MyException;
import com.zcc.log.annotation.Log;
import com.zcc.platform.warning.entity.WarningEntity;
import com.zcc.platform.warning.service.WarningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @author zcc
 */
@RestController
@RequestMapping("/warnings")
public class WarningController {

    @Autowired
    private WarningService service;

    @Log(name = "保存预警")
    @PostMapping("/save")
    public ResultBean save(WarningEntity warningEntity) {
        service.saveWarning(warningEntity);
        return ResultBean.success();
    }

    @Log(name = "根据Id删除预警")
    @DeleteMapping("/{noticeId}")
    public ResultBean delWarningById(@PathVariable("noticeId") String noticeId) {
        service.delWarningById(noticeId);
        return ResultBean.success();
    }

    @Log(name = "根据预警类型删除预警")
    @DeleteMapping("/type/{noticeType}")
    public ResultBean delWarningByType(@PathVariable("noticeType") String noticeType) {
        service.delWarningByType(noticeType);
        return ResultBean.success();
    }

    @Log(name = "根据预警ID查找预警")
    @GetMapping("/{noticeId}")
    public ResultBean findWarningById(@PathVariable("noticeId") String noticeId) {
        return ResultBean.success(service.findWarningById(noticeId));
    }

    @Log(name = "查找预警")
    @PostMapping("/find")
    public ResultBean findWarning(String noticeName, String noticeType, String begin, String end, String tags, int page, int pageSize) throws MyException {
        Map<String, Object> map = new HashMap<>(2);
        map.put("total", service.findWarning(noticeName, noticeType, begin, end, tags).size());
        map.put("data", service.findWarning(noticeName, noticeType, begin, end, tags, Page.setPageAndSize(page, pageSize)));
        return ResultBean.success(map);
    }

    @Log(name = "查找全部预警")
    @PostMapping("/findAll")
    public ResultBean findAll(int page, int pageSize) throws MyException {
        Map<String, Object> map = new HashMap<>(2);
        map.put("total", service.findAll().size());
        map.put("data", service.findAll(Page.setPageAndSize(page, pageSize)));
        return ResultBean.success(map);
    }

    @Log(name = "更新自动预警")
    @GetMapping("/auto")
    public ResultBean autoWarning() {
        service.autoWarning();
        return ResultBean.success();
    }

}
