package com.zcc.platform.event.controller;

import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.ResultBean;
import com.zcc.commons.utils.StringUtil;
import com.zcc.exceptions.MyException;
import com.zcc.log.annotation.Log;
import com.zcc.platform.event.entity.EventInfoEntity;
import com.zcc.platform.event.entity.EventRelationEntity;
import com.zcc.platform.event.service.EventInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zcc
 */
@Controller("eventInfoController")
@RequestMapping("/eventInfo")
public class EventInfoController {

    @Autowired
    private EventInfoService eventInfoService;


    @Log(name = "保存事件")
    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResultBean save(EventInfoEntity eventInfoEntity, HttpServletRequest request, String tags, String linkPersonNos, String linkUnitNos, String linkEventNos) {
        String eventId = eventInfoService.save(eventInfoEntity, request, tags, linkPersonNos, linkUnitNos, linkEventNos);
        return ResultBean.success();
    }

    @Log(name = "删除事件")
    @ResponseBody
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public ResultBean del(String eventId, HttpServletRequest request) {
        eventInfoService.del(eventId, request);
        return ResultBean.success();
    }

    @Log(name = "查找全部事件")
    @ResponseBody
    @RequestMapping(value = "/findAll", method = RequestMethod.POST)
    public ResultBean findAll() {
        return ResultBean.success(eventInfoService.findAll());
    }

    @Log(name = "根据id查找事件")
    @ResponseBody
    @RequestMapping(value = "/findById", method = RequestMethod.POST)
    public ResultBean findById(String eventId) {
        return ResultBean.success(eventInfoService.find(eventId));
    }

    @Log(name = "查找事件")
    @ResponseBody
    @RequestMapping(value = "/findByParam", method = RequestMethod.POST)
    public ResultBean findByParam(@RequestParam Map<String, Object> param) throws Exception {
        Map<String, Object> map = new HashMap<>(2);
        List<EventInfoEntity> events = eventInfoService.find(param, Page.setPageAndSize(Integer.parseInt(StringUtil.safeToString(param.get("page"))), Integer.parseInt(StringUtil.safeToString(param.get("pageSize")))));
        int count = eventInfoService.find(param).size();
        map.put("events", events);
        map.put("count", count);
        return ResultBean.success(map);
    }

    @Log(name = "添加事件关联对象")
    @ResponseBody
    @RequestMapping(value = "/addEventRelationObject", method = RequestMethod.POST)
    public ResultBean addEventRelationObject(EventRelationEntity eventRelationEntity) {
        return ResultBean.success(eventInfoService.addEventRelationObject(eventRelationEntity));
    }

    @Log(name = "删除事件关联对象")
    @ResponseBody
    @RequestMapping(value = "/delEventRelationObject", method = RequestMethod.POST)
    public ResultBean delEventRelationObject(String eventId, String objectId) {
        eventInfoService.delEventRelationObject(eventId, objectId);
        return ResultBean.success();
    }

    @Log(name = "单个事件数据聚合")
    @ResponseBody
    @RequestMapping(value = "/findDataTogether", method = RequestMethod.POST)
    public ResultBean findDataTogether(String eventId, Integer page, Integer pageSize) throws Exception {
        Map<String, Object> map = new HashMap<>(2);
        List<EventInfoEntity> dataTogether = eventInfoService.findDataTogether(eventId, Page.setPageAndSize(page, pageSize));
        int count = eventInfoService.findDataTogether(eventId).size();
        map.put("dataTogether", dataTogether);
        map.put("count", count);
        return ResultBean.success(map);
    }

    @Log(name = "全部事件数据聚合")
    @ResponseBody
    @RequestMapping(value = "/findAllDataTogether", method = RequestMethod.POST)
    public ResultBean findAllDataTogether(Integer page, Integer pageSize) throws MyException {
        Map<String, Object> map = new HashMap<>(2);
        List<EventInfoEntity> dataTogether = eventInfoService.findDataTogether(Page.setPageAndSize(page, pageSize));
        int count = eventInfoService.findDataTogether().size();
        map.put("dataTogether", dataTogether);
        map.put("count", count);
        return ResultBean.success(map);
    }
}
