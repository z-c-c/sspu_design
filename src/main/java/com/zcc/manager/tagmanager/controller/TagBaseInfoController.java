package com.zcc.manager.tagmanager.controller;

import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.ResultBean;
import com.zcc.exceptions.MyException;
import com.zcc.log.annotation.Log;
import com.zcc.manager.tagmanager.dao.TagBaseInfoDao;
import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import com.zcc.manager.tagmanager.service.TagBaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @author zcc
 */
@Controller("tagBaseInfoController")
@RequestMapping("/tagBaseInfo")
public class TagBaseInfoController {


    @Autowired
    private TagBaseInfoService tagBaseInfoService;


    @Log(name = "保存标签")
    @RequestMapping(value = "/saveTag", method = RequestMethod.POST)
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

    @Log(name = "根据标签名查找标签")
    @ResponseBody
    @RequestMapping(value = "/findTagByName",method = RequestMethod.POST)
    public ResultBean findTagByName(String tagName){
        return ResultBean.success(tagBaseInfoService.find(tagName));
    }

    @Log(name = "根据id查找标签")
    @ResponseBody
    @RequestMapping(value = "/findTagById", method = RequestMethod.POST)
    public ResultBean findTagById(String tagId) {
        return ResultBean.success(tagBaseInfoService.findById(tagId));
    }

    @Log(name = "根据变化参数查找标签")
    @ResponseBody
    @RequestMapping(value = "/findTagByParam",method = RequestMethod.POST)
    public ResultBean findTagByParam(TagBaseInfoEntity tagBaseInfoEntity){
        return ResultBean.success(tagBaseInfoService.find(tagBaseInfoEntity));
    }

    @Log(name = "分页查找标签")
    @ResponseBody
    @RequestMapping(value = "/findTagWithPage", method = RequestMethod.POST)
    public ResultBean findTagWithPage(TagBaseInfoEntity tagBaseInfoEntity, int page, int pageSize) throws MyException {
        Map<String, Object> map = new HashMap<>(2);
        map.put("total", tagBaseInfoService.find(tagBaseInfoEntity).size());
        map.put("tags", tagBaseInfoService.find(tagBaseInfoEntity, Page.setPageAndSize(page, pageSize)));
        return ResultBean.success(map);
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
