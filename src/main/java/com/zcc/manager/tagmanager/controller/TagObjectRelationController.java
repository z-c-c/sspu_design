package com.zcc.manager.tagmanager.controller;

import com.zcc.commons.utils.ResultBean;
import com.zcc.log.annotation.Log;
import com.zcc.manager.tagmanager.entity.TagObjectRelationEntity;
import com.zcc.manager.tagmanager.service.TagObjectRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zcc
 */
@Controller("TagObjectRelationController")
@RequestMapping("/tagObjectRelation")
public class TagObjectRelationController {

    @Autowired
    private TagObjectRelationService tagObjectRelationService;

    @Log(name = "获取对象拥有的标签")
    @ResponseBody
    @RequestMapping(value = "/findTagByObjectId", method = RequestMethod.POST)
    public ResultBean findTagByObjectId(String objectId) {
        return ResultBean.success(tagObjectRelationService.findTagByObjectId(objectId));
    }

    @Log(name = "为对象添加标签")
    @ResponseBody
    @RequestMapping(value = "/addTagForObject", method = RequestMethod.POST)
    public ResultBean addTagForObject(TagObjectRelationEntity tagObjectRelationEntity) {
        tagObjectRelationService.addTagForObject(tagObjectRelationEntity);
        return ResultBean.success();
    }

    @Log(name = "删除对象的标签")
    @ResponseBody
    @RequestMapping(value = "/delTagForObject", method = RequestMethod.POST)
    public ResultBean delTagForObject(String tagId, String objectId) {
        tagObjectRelationService.delTagForObject(tagId, objectId);
        return ResultBean.success();
    }
}
