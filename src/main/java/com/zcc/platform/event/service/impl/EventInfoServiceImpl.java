package com.zcc.platform.event.service.impl;

import com.zcc.commons.utils.ConstUtil;
import com.zcc.commons.utils.DateFormat;
import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.StringUtil;
import com.zcc.manager.tagmanager.entity.TagObjectRelationEntity;
import com.zcc.manager.tagmanager.service.TagObjectRelationService;
import com.zcc.manager.usermanager.entity.UserInfoEntity;
import com.zcc.platform.event.dao.EventInfoDao;
import com.zcc.platform.event.dao.EventRelationDao;
import com.zcc.platform.event.entity.EventInfoEntity;
import com.zcc.platform.event.entity.EventRelationEntity;
import com.zcc.platform.event.entity.HandleLogEntity;
import com.zcc.platform.event.service.EventInfoService;
import com.zcc.platform.person.dao.PersonDao;
import com.zcc.platform.person.entity.PersonEntity;
import com.zcc.platform.unit.dao.UnitDao;
import com.zcc.platform.unit.entity.UnitEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @author zcc
 */
@Service("eventInfoService")
public class EventInfoServiceImpl implements EventInfoService {

    @Autowired
    private EventInfoDao eventInfoDao;
    @Autowired
    private EventRelationDao eventRelationDao;
    @Autowired
    private TagObjectRelationService tagObjectRelationService;
    @Autowired
    private PersonDao personDao;
    @Autowired
    private UnitDao unitDao;

    /**
     * 保存事件
     *
     * @param eventInfoEntity eventInfoEntity
     * @return id
     */
    @Override
    public String save(EventInfoEntity eventInfoEntity, HttpServletRequest request, String tags, String linkPersonNos, String linkUnitNos, String linkEventNos) {
        UserInfoEntity currentPerson = ConstUtil.currentPerson(request);
        if (StringUtil.isValidStr(eventInfoEntity.getEventId())) {
            eventInfoEntity.setUpdateUserAccount(currentPerson.getUserName());
            eventInfoEntity.setUpdateTime(new Date());
            eventInfoDao.update(eventInfoEntity);

        } else {
            eventInfoEntity.setCreateTime(new Date());
            eventInfoEntity.setUpdateTime(new Date());
            eventInfoEntity.setCreateUserAccount(currentPerson.getUserName());
            eventInfoEntity.setUpdateUserAccount(currentPerson.getUserName());
            eventInfoEntity.setIsHandle("0");
            eventInfoEntity.setIsSettlement("0");
            eventInfoDao.add(eventInfoEntity);
        }
        //事件打标签
        if (StringUtil.isValidStr(tags)) {
            String[] split = tags.split(",");
            //先删除对象拥有的所有标签
            tagObjectRelationService.delTagForObject(eventInfoEntity.getEventId());
            for (String s : split) {
                TagObjectRelationEntity tagObjectRelationEntity = new TagObjectRelationEntity();
                tagObjectRelationEntity.setTagId(s);
                tagObjectRelationEntity.setObjectId(eventInfoEntity.getEventId());
                tagObjectRelationEntity.setObjectType(ConstUtil.EVENT_TAG);
                tagObjectRelationEntity.setIsDelete("0");
                tagObjectRelationService.addTagForObject(tagObjectRelationEntity);
            }
        } else {
            tagObjectRelationService.delTagForObject(eventInfoEntity.getEventId());
        }
        //添加事件关联人员
        if (StringUtil.isValidStr(linkPersonNos)) {
            String[] split = linkPersonNos.split(",");
            for (String s : split) {
                addEventRelationObject(eventInfoEntity, s, EventRelationEntity.OBJECT_TYPE_PERSON);
            }
        } else {
            eventRelationDao.delEventRelationType(eventInfoEntity.getEventId(), EventRelationEntity.OBJECT_TYPE_PERSON);
        }
        //添加事件关联单位
        if (StringUtil.isValidStr(linkUnitNos)) {
            String[] split = linkUnitNos.split(",");
            for (String s : split) {
                addEventRelationObject(eventInfoEntity, s, EventRelationEntity.OBJECT_TYPE_UNIT);
            }
        } else {
            eventRelationDao.delEventRelationType(eventInfoEntity.getEventId(), EventRelationEntity.OBJECT_TYPE_UNIT);
        }
        //添加事件关联事件
        if (StringUtil.isValidStr(linkEventNos)) {
            String[] split = linkEventNos.split(",");
            for (String s : split) {
                addEventRelationObject(eventInfoEntity, s, EventRelationEntity.OBJECT_TYPE_EVENT);
            }
        } else {
            eventRelationDao.delEventRelationType(eventInfoEntity.getEventId(), EventRelationEntity.OBJECT_TYPE_EVENT);
        }

        return eventInfoEntity.getEventId();
    }

    private void addEventRelationObject(EventInfoEntity eventInfoEntity, String objectId, String objectTypeEvent) {
        EventRelationEntity eventRelationEntity = new EventRelationEntity();
        eventRelationEntity.setEventId(eventInfoEntity.getEventId());
        eventRelationEntity.setObjectId(objectId);
        eventRelationEntity.setObjectType(objectTypeEvent);
        eventRelationEntity.setIsDelete("0");
        eventRelationEntity.setRelationTime(new Date());
        this.addEventRelationObject(eventRelationEntity);
    }

    /**
     * 删除事件
     *
     * @param eventId id
     */
    @Override
    public void del(String eventId, HttpServletRequest request) {
        UserInfoEntity currentPerson = ConstUtil.currentPerson(request);
        eventInfoDao.del(eventId, DateFormat.dataFormat(new Date(), DateFormat.YYYY_MM_DD_HH_MM_SS), currentPerson.getUserName());
    }

    /**
     * 查找
     *
     * @return list
     */
    @Override
    public List<EventInfoEntity> findAll() {
        return eventInfoDao.findAll();
    }

    /**
     * 根据id查找事件
     *
     * @param eventId eventId
     * @return EventInfoEntity
     */
    @Override
    public EventInfoEntity find(String eventId) {
        return eventInfoDao.findById(eventId);
    }

    /**
     * 查找事件
     *
     * @param map  map
     * @param page page
     * @return list
     */
    @Override
    public List<EventInfoEntity> find(Map<String, Object> map, Page page) {
        formatTime(map);
        if (StringUtil.isValidStr(StringUtil.safeToString(map.get(ConstUtil.TAGS)))) {
            List<String> tags = Arrays.asList(StringUtil.safeToString(map.get(ConstUtil.TAGS)).split(","));
            map.remove(ConstUtil.TAGS);
            map.put(ConstUtil.TAGS, tags);
            return eventInfoDao.findByParamWithTag(map, page);
        } else {
            return eventInfoDao.findByParamWithPage(map, page);
        }
    }

    private void formatTime(Map<String, Object> map) {
        if (StringUtil.isValidStr(StringUtil.safeToString(map.get("occurredTime")))) {
            map.put("beginTime", StringUtil.safeToString(map.get("occurredTime")).substring(0, 10));
            map.put("endTime", StringUtil.safeToString(map.get("occurredTime")).substring(StringUtil.safeToString(map.get("occurredTime")).length() - 10));
        }
        if (StringUtil.isValidStr(StringUtil.safeToString(map.get("settlementTime")))) {
            map.put("beginTime", StringUtil.safeToString(map.get("settlementTime")).substring(0, 10));
            map.put("endTime", StringUtil.safeToString(map.get("settlementTime")).substring(StringUtil.safeToString(map.get("occurredTime")).length() - 10));
        }
    }

    /**
     * 查找事件
     *
     * @param map map
     * @return list
     */
    @Override
    public List<EventInfoEntity> find(Map<String, Object> map) {
        formatTime(map);
        if (StringUtil.isValidStr(StringUtil.safeToString(map.get(ConstUtil.TAGS)))) {
            return eventInfoDao.findByParamWithTagNoPage(map);
        } else {
            return eventInfoDao.findByParam(map);
        }
    }

    /**
     * 添加事件关联对象
     *
     * @param eventRelationEntity eventRelationEntity
     * @return id
     */
    @Override
    public String addEventRelationObject(EventRelationEntity eventRelationEntity) {
        EventRelationEntity byEventIdAndObjectId = eventRelationDao.findByEventIdAndObjectId(eventRelationEntity.getEventId(), eventRelationEntity.getObjectId());
        if (byEventIdAndObjectId == null) {
            eventRelationDao.addEventRelationObject(eventRelationEntity);
        } else {
            eventRelationDao.updateEventRelationObject(eventRelationEntity.getEventId(), eventRelationEntity.getObjectId(), eventRelationEntity.getRelationTime());
        }
        return eventRelationEntity.getEventId();
    }


    @Override
    public List findEventRelationObject(String eventId, String objectType) {
        //查找关联人员
        if (EventRelationEntity.OBJECT_TYPE_PERSON.equals(objectType)) {
            List<PersonEntity> result = new ArrayList<>();
            List<EventRelationEntity> byEventIdAndObjectType = eventRelationDao.findByEventIdAndObjectType(eventId, objectType);
            for (EventRelationEntity eventRelationEntity : byEventIdAndObjectType) {
                if (personDao.findPersonById(eventRelationEntity.getObjectId()) != null) {
                    result.add(personDao.findPersonById(eventRelationEntity.getObjectId()));
                }

            }
            return result;
        } else if (EventRelationEntity.OBJECT_TYPE_UNIT.equals(objectType)) {
            List<UnitEntity> result = new ArrayList<>();
            List<EventRelationEntity> byEventIdAndObjectType = eventRelationDao.findByEventIdAndObjectType(eventId, objectType);
            for (EventRelationEntity eventRelationEntity : byEventIdAndObjectType) {
                if (unitDao.findUnitById(eventRelationEntity.getObjectId()) != null) {
                    result.add(unitDao.findUnitById(eventRelationEntity.getObjectId()));
                }
            }
            return result;
        }
        return null;
    }

    @Override
    public List findEventRelationObjectSimp(String eventId, String objectType) {
        if (EventRelationEntity.OBJECT_TYPE_PERSON.equals(objectType)) {
            return eventRelationDao.findEventLinkPerson(eventId);
        } else if (EventRelationEntity.OBJECT_TYPE_UNIT.equals(objectType)) {
            return eventRelationDao.findEventLinkUnit(eventId);
        } else {
            List eventLinkPerson = eventRelationDao.findEventLinkPerson(eventId);
            List eventLinkUnit = eventRelationDao.findEventLinkUnit(eventId);
            eventLinkPerson.addAll(eventLinkUnit);
            return eventLinkPerson;
        }
    }

    @Override
    public List<EventInfoEntity> findObjectLinkEvent(String objectId, String objectType) {
        return eventRelationDao.findObjectLinkEvent(objectId, objectType);
    }

    /**
     * 删除事件关联对象
     *
     * @param eventId  eventId
     * @param objectId objectId
     */
    @Override
    public void delEventRelationObject(String eventId, String objectId) {
        eventRelationDao.delEventRelationObject(eventId, objectId);
    }


    /**
     * 单个事件的数据聚合,分页
     *
     * @param eventId eventId
     * @param page    page
     * @return list
     */
    @Override
    public List<EventInfoEntity> findDataTogether(String eventId, Page page) {
        return eventInfoDao.findDataTogetherByIdWithPage(eventId, page);
    }

    /**
     * 单个事件的所有数据聚合
     *
     * @param eventId eventId
     * @return list
     */
    @Override
    public List<EventInfoEntity> findDataTogether(String eventId) {
        return eventInfoDao.findDataTogetherById(eventId);
    }

    /**
     * 所有事件的数据聚合、分页
     *
     * @param page page
     * @return list
     */
    @Override
    public List<EventInfoEntity> findDataTogether(Page page) {
        return eventInfoDao.findAllDataTogetherWithPage(page);
    }

    /**
     * 所有事件的数据聚合
     *
     * @return list
     */
    @Override
    public List<EventInfoEntity> findDataTogether() {
        return eventInfoDao.findAllDataTogether();
    }

    @Override
    public int saveEventHandleLog(HandleLogEntity handleLogEntity, HttpServletRequest request) {
        UserInfoEntity userInfoEntity = ConstUtil.currentPerson(request);
        handleLogEntity.setHandleCreateTime(new Date());
        handleLogEntity.setHandleCreateUser(userInfoEntity.getUserName());
        handleLogEntity.setIsDelete("0");
        //有id为修改
        if (StringUtil.isValidStr(StringUtil.safeToString(handleLogEntity.getHandleLogId()))) {
            HandleLogEntity handleLog = eventInfoDao.findHandleLog(handleLogEntity.getHandleLogId());
            if (!StringUtil.isValidStr(handleLogEntity.getHandleFilePath())) {
                handleLogEntity.setHandleFilePath(handleLog.getHandleFilePath());
            }
            eventInfoDao.updateEventHandleLog(handleLogEntity);
        } else {
            eventInfoDao.addEventHandleLog(handleLogEntity);
        }
        //修改事件为已经处置
        EventInfoEntity eventInfo = eventInfoDao.findById(handleLogEntity.getHandleEventId());
        eventInfo.setIsHandle("1");
        eventInfoDao.update(eventInfo);
        return handleLogEntity.getHandleLogId();
    }

    @Override
    public List<HandleLogEntity> findEventHandleLog(String eventId, Page page) {
        return eventInfoDao.findEventHandleLogWithPage(eventId, page);
    }

    @Override
    public List<HandleLogEntity> findEventHandleLog(String eventId) {
        return eventInfoDao.findEventHandleLog(eventId);
    }

    @Override
    public HandleLogEntity findHandleLog(Integer handleLogId) {
        return eventInfoDao.findHandleLog(handleLogId);
    }

    @Override
    public void delHandleLog(int handleLogId) {
        eventInfoDao.delHandleLog(handleLogId);
    }

    @Override
    public void settlement(HttpServletRequest request, EventInfoEntity eventInfoEntity) {
        UserInfoEntity currentPerson = ConstUtil.currentPerson(request);
        if (StringUtil.isValidStr(eventInfoEntity.getEventId())) {
            eventInfoEntity.setUpdateUserAccount(currentPerson.getUserName());
            eventInfoEntity.setUpdateTime(new Date());
            eventInfoEntity.setIsSettlement("1");
            eventInfoDao.update(eventInfoEntity);

        }
    }
}
