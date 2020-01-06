package com.zcc.manager.tagmanager.controller;

import com.zcc.commons.utils.ResultBean;
import com.zcc.log.annotation.Log;
import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import com.zcc.manager.tagmanager.service.TagBaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author zcc
 */
@Controller("tagBaseInfoController")
@RequestMapping("/tagBaseInfo")
public class TagBaseInfoController {


    @Autowired
    private TagBaseInfoService tagBaseInfoService;

    @Log(name = "添加标签")
    @RequestMapping(value = "/addTag",method = RequestMethod.POST)
    @ResponseBody
    public ResultBean addTag(TagBaseInfoEntity tagBaseInfoEntity){
        tagBaseInfoService.save(tagBaseInfoEntity);
        return ResultBean.success();
    }

    @Log(name = "删除标签")
    @ResponseBody
    @RequestMapping(value = "/delTag",method = RequestMethod.POST)
    public ResultBean delTag(String tagId){
        tagBaseInfoService.del(tagId);
        return ResultBean.success();
    }

    @Log(name = "修改标签")
    @ResponseBody
    @RequestMapping(value = "/updateTag",method = RequestMethod.POST)
    public ResultBean updateTag(TagBaseInfoEntity tagBaseInfoEntity){
        tagBaseInfoService.save(tagBaseInfoEntity);
        return ResultBean.success();
    }

    @Log(name = "根据标签名查找标签")
    @ResponseBody
    @RequestMapping(value = "/findTagByName",method = RequestMethod.POST)
    public ResultBean findTagByName(String tagName){
        return ResultBean.success(tagBaseInfoService.find(tagName));
    }

    @Log(name = "根据变化参数查找标签")
    @ResponseBody
    @RequestMapping(value = "/findTagByParam",method = RequestMethod.POST)
    public ResultBean findTagByParam(TagBaseInfoEntity tagBaseInfoEntity){
        return ResultBean.success(tagBaseInfoService.find(tagBaseInfoEntity));
    }

    @Log(name = "查找所有标签")
    @ResponseBody
    @RequestMapping(value = "/findAllTag",method = RequestMethod.POST)
    public ResultBean findAllTag(){
        return ResultBean.success(tagBaseInfoService.findAll());
    }

    @Log(name = "根据标签标注对象查标签")
    @ResponseBody
    @RequestMapping(value = "/findByObjectId",method = RequestMethod.POST)
    public ResultBean findByObjectId(String objectId){
        return ResultBean.success(tagBaseInfoService.findTagByObject(objectId));
    }
}
