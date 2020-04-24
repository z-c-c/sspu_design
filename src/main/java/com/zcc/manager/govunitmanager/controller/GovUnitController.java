package com.zcc.manager.govunitmanager.controller;

import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.ResultBean;
import com.zcc.manager.govunitmanager.entity.GovUnitEntity;
import com.zcc.manager.govunitmanager.service.GovUnitService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zcc
 * govUnit控制器
 */
@RestController
@RequestMapping("govUnit")
public class GovUnitController {

    private GovUnitService govUnitService;

    /**
     * 添加政府部门
     *
     * @param govUnitEntity govUnit
     * @return
     */
    ResultBean add(GovUnitEntity govUnitEntity) {
        return ResultBean.success(govUnitService.add(govUnitEntity));
    }

    /**
     * 删除政府部门
     *
     * @param id
     */
    ResultBean delete(int id) {
        govUnitService.delete(id);
        return ResultBean.success();
    }

    /**
     * 修改政府部门
     */
    ResultBean update(GovUnitEntity govUnitEntity) {
        govUnitService.update(govUnitEntity);
        return ResultBean.success();

    }

    /**
     * 查找政府部门
     *
     * @return list
     */
    ResultBean findAll() {
        return ResultBean.success(govUnitService.findAll());
    }

    /**
     * 查找政府部门
     *
     * @param page page
     * @return list
     */
    ResultBean findAllWithPage(Page page) {
        return ResultBean.success(govUnitService.findAllWithPage(page));
    }

}
