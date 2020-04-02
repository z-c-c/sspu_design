package com.zcc.platform.unit.controller;

import com.zcc.platform.unit.entity.UnitEntity;
import com.zcc.platform.unit.service.UnitInfoService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (UnitInfo)表控制层
 *
 * @author makejava
 * @since 2020-04-02 11:31:11
 */
@RestController
@RequestMapping("unitInfo")
public class UnitInfoController {
    /**
     * 服务对象
     */
    @Resource
    private UnitInfoService unitInfoService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public UnitEntity selectOne(String id) {
        return this.unitInfoService.queryById(id);
    }

}