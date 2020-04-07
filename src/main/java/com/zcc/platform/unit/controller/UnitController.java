package com.zcc.platform.unit.controller;

import com.zcc.commons.utils.ResultBean;
import com.zcc.log.annotation.Log;
import com.zcc.platform.unit.entity.UnitEntity;
import com.zcc.platform.unit.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @author zcc
 */
@RestController
@RequestMapping("/units")
public class UnitController {


    private final UnitService unitService;

    @Autowired
    public UnitController(UnitService unitService) {
        this.unitService = unitService;
    }

    @Log(name = "保存单位")
    @PostMapping("/save")
    public ResultBean save(UnitEntity unitEntity, String tags) {
        return ResultBean.success(unitService.save(unitEntity, tags));
    }

    @Log(name = "删除单位")
    public ResultBean del(String unitId) {
        unitService.del(unitId);
        return ResultBean.success();
    }

    @Log(name = "查找单位")
    @GetMapping("/{id}")
    public ResultBean find(@PathVariable("id") String unitId) {
        return ResultBean.success(unitService.findById(unitId));
    }

    @Log(name = "查找单位经营状态统计")
    @GetMapping("/status")
    public ResultBean findByStatus() {
        int on = unitService.findByStatus("1").size();
        int un = unitService.findByStatus("0").size();
        Map<String, Object> map = new HashMap<>(2);
        map.put("onStatus", on);
        map.put("unStatus", un);
        return ResultBean.success(map);
    }

    @Log(name = "查找单位")
    @PostMapping("/param")
    public ResultBean findByParam(String param, String tags, int page, int pageSize) {
        return ResultBean.success();
    }

    @Log(name = "单个单位的数据聚合")
    @PostMapping("/dataTogether")
    public ResultBean dataTogether(String unitId, int page, int pageSize) {
        return ResultBean.success();
    }

    @Log(name = "所有单位的数据聚合")
    @PostMapping("/dataTogether/all")
    public ResultBean dataTogether(int page, int pageSize) {
        return ResultBean.success();
    }

}
