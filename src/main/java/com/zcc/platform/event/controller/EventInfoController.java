package com.zcc.platform.event.controller;

import com.zcc.commons.utils.*;
import com.zcc.exceptions.MyException;
import com.zcc.log.annotation.Log;
import com.zcc.manager.govunitmanager.entity.GovUnitEntity;
import com.zcc.manager.govunitmanager.entity.GovUnitRelation;
import com.zcc.manager.govunitmanager.service.GovUnitService;
import com.zcc.manager.usermanager.entity.UserInfoEntity;
import com.zcc.platform.event.entity.EventInfoEntity;
import com.zcc.platform.event.entity.EventRelationEntity;
import com.zcc.platform.event.entity.HandleLogEntity;
import com.zcc.platform.event.service.EventInfoService;
import com.zcc.platform.warning.entity.WarningEntity;
import com.zcc.platform.warning.service.WarningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zcc
 */
@RestController("eventInfoController")
@RequestMapping("/eventInfo")
public class EventInfoController {

    @Autowired
    private EventInfoService eventInfoService;
    @Autowired
    private GovUnitService govUnitService;

    @Autowired
    private WarningService warningService;

    @Log(name = "保存事件")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResultBean save(EventInfoEntity eventInfoEntity, HttpServletRequest request, String tags, String linkPersonNos, String linkUnitNos, String linkEventNos) {
        String eventId = eventInfoService.save(eventInfoEntity, request, tags, linkPersonNos, linkUnitNos, linkEventNos);

        WarningEntity warning = warningService.findWarningByNoticeObjectIdAndType(eventId, WarningEntity.WARNING_EVENT);
        if (warning != null) {
            warningService.saveWarning(warning);
        }
        return ResultBean.success();
    }

    @Log(name = "删除事件")
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public ResultBean del(String eventId, HttpServletRequest request) {
        eventInfoService.del(eventId, request);
        //同时删除事件的预警
        warningService.delWarningForObject(WarningEntity.WARNING_EVENT, eventId);
        return ResultBean.success();
    }

    @Log(name = "查找全部事件")
    @RequestMapping(value = "/findAll", method = RequestMethod.POST)
    public ResultBean findAll() {
        return ResultBean.success(eventInfoService.findAll());
    }

    @Log(name = "根据id查找事件")
    @RequestMapping(value = "/findById", method = RequestMethod.POST)
    public ResultBean findById(String eventId) {
        return ResultBean.success(eventInfoService.find(eventId));
    }

    @Log(name = "查找事件")
    @RequestMapping(value = "/findByParam", method = RequestMethod.POST)
    public ResultBean findByParam(@RequestParam Map<String, Object> param) throws Exception {
        Map<String, Object> map = new HashMap<>(2);
        List<EventInfoEntity> events = eventInfoService.find(param, Page.setPageAndSize(Integer.parseInt(StringUtil.safeToString(param.get("page"))), Integer.parseInt(StringUtil.safeToString(param.get("pageSize")))));
        int count = eventInfoService.find(param).size();
        map.put("events", events);
        map.put("count", count);
        return ResultBean.success(map);
    }

    @Log(name = "事件处置统计")
    @RequestMapping(value = "/handleCount", method = RequestMethod.GET)
    public ResultBean handleCount() {
        HashMap map = new HashMap<>(2);
        map.put("isHandle", "1");
        int handled = eventInfoService.find(map).size();
        map.clear();
        map.put("isHandle", "0");
        int handling = eventInfoService.find(map).size();
        map.clear();
        map.put("handled", handled);
        map.put("handling", handling);
        return ResultBean.success(map);
    }

    @Log(name = "添加事件关联对象")
    @RequestMapping(value = "/addEventRelationObject", method = RequestMethod.POST)
    public ResultBean addEventRelationObject(EventRelationEntity eventRelationEntity) {
        return ResultBean.success(eventInfoService.addEventRelationObject(eventRelationEntity));
    }

    @Log(name = "删除事件关联对象")
    @RequestMapping(value = "/delEventRelationObject", method = RequestMethod.POST)
    public ResultBean delEventRelationObject(String eventId, String objectId) {
        eventInfoService.delEventRelationObject(eventId, objectId);
        return ResultBean.success();
    }

    @Log(name = "查找事件关联对象（详细信息）")
    @PostMapping("/findEventRelationObject")
    public ResultBean findEventRelationObject(String eventId, String objectType) {
        return ResultBean.success(eventInfoService.findEventRelationObject(eventId, objectType));
    }

    @Log(name = "查找事件关联对象（简略信息）")
    @GetMapping("/findEventRelationObject")
    public ResultBean eventRelationObject(String id, String objectType, String type) {
        //如果type是event,则eventId实际上为ObjectId，即通过对象查事件
        if (EventRelationEntity.OBJECT_TYPE_EVENT.equals(objectType)) {
            return ResultBean.success(eventInfoService.findObjectLinkEvent(id, type));
        }
        //如果type不是event，则是通过事件查对象的
        else {
            return ResultBean.success(eventInfoService.findEventRelationObjectSimp(id, objectType));
        }

    }

    @Log(name = "查找对象关联的事件")
    @PostMapping("/findObjectLinkEvent")
    public ResultBean findObjectLinkEvent(String objectId, String objectType) {
        return ResultBean.success(eventInfoService.findObjectLinkEvent(objectId, objectType));
    }

    @Log(name = "单个事件数据聚合")
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
    @RequestMapping(value = "/findAllDataTogether", method = RequestMethod.POST)
    public ResultBean findAllDataTogether(Integer page, Integer pageSize) throws MyException {
        Map<String, Object> map = new HashMap<>(2);
        List<EventInfoEntity> dataTogether = eventInfoService.findDataTogether(Page.setPageAndSize(page, pageSize));
        int count = eventInfoService.findDataTogether().size();
        map.put("dataTogether", dataTogether);
        map.put("count", count);
        return ResultBean.success(map);
    }

    @Log(name = "添加责任单位")
    @PostMapping(value = "/addResponsibilityUnit")
    public ResultBean addResponsibilityUnit(@RequestBody List<GovUnitRelation> govUnitRelations) {
        govUnitService.addGovRelation(govUnitRelations);
        return ResultBean.success();
    }

    @Log(name = "查找事件责任单位")
    @GetMapping(value = "/findResponsibilityUnit")
    public ResultBean findResponsibilityUnit(String eventId) {
        Map<String, Object> map = new HashMap<>(2);
        GovUnitEntity zb = govUnitService.findGovRelationUnit(eventId, "1");
        GovUnitEntity wb = govUnitService.findGovRelationUnit(eventId, "0");
        map.put("zb", zb);
        map.put("xb", wb);
        return ResultBean.success(map);
    }

    @Log(name = "保存事件处置日志")
    @PostMapping(value = "/saveEventHandleLog")
    public ResultBean saveEventHandleLog(HandleLogEntity handleLogEntity, HttpServletRequest request) {
        UserInfoEntity currentPerson = ConstUtil.currentPerson(request);
        handleLogEntity.setHandleUser(currentPerson.getUserName());
        return ResultBean.success(eventInfoService.saveEventHandleLog(handleLogEntity, request));
    }

    @Log(name = "查找事件处置日志")
    @GetMapping(value = "/findEventHandleLog")
    public ResultBean findEventHandleLog(String eventId, Page page) throws MyException {
        Map<String, Object> map = new HashMap<>(2);
        List<HandleLogEntity> eventHandleLog = eventInfoService.findEventHandleLog(eventId, Page.setPageAndSize(page.getPage(), page.getPageSize()));
        List<HandleLogEntity> all = eventInfoService.findEventHandleLog(eventId);
        map.put("data", eventHandleLog);
        map.put("all", all);
        return ResultBean.success(map);
    }


    @Log(name = "查找事件处置日志")
    @GetMapping("/findHandleLog")
    public ResultBean findHandleLog(Integer handleLogId) {
        return ResultBean.success(eventInfoService.findHandleLog(handleLogId));
    }

    @Log(name = "删除处置日志")
    @GetMapping("/delHandleLog")
    public ResultBean delHandleLog(Integer handleLogId) {
        eventInfoService.delHandleLog(handleLogId);
        return ResultBean.success();
    }

    @Log(name = "上传处置附件")
    @PostMapping("/uploadFile")
    public ResultBean uploadFile(HttpServletRequest request, String attrName, Integer handleLogLd) {
        HandleLogEntity handleLog = eventInfoService.findHandleLog(handleLogLd);
        String filePath = FileUtil.upLoad(request, attrName, StringUtil.safeToString(handleLogLd));
        if (StringUtil.isValidStr(filePath)) {
            handleLog.setHandleFilePath(filePath);
            eventInfoService.saveEventHandleLog(handleLog, request);
        }
        return ResultBean.success();
    }

    @ResponseBody
    @PostMapping("/downloadFile")
    public void downloadFile(HttpServletRequest request, HttpServletResponse response) {
        FileUtil.downLoad(response, request, request.getParameter("filePath"));
    }

    @Log(name = "事件化解存档")
    @PostMapping(value = "/settlement")
    public ResultBean settlementEvent(HttpServletRequest request, EventInfoEntity eventInfoEntity) {
        eventInfoService.settlement(request, eventInfoEntity);
        return ResultBean.success();
    }
}
