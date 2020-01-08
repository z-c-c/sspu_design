package com.zcc.platform.event.service.impl;

import com.zcc.commons.utils.ConstUtil;
import com.zcc.commons.utils.DateFormat;
import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.StringUtil;
import com.zcc.manager.usermanager.entity.UserInfoEntity;
import com.zcc.platform.event.dao.EventInfoDao;
import com.zcc.platform.event.dao.EventRelationDao;
import com.zcc.platform.event.entity.EventInfoEntity;
import com.zcc.platform.event.entity.EventRelationEntity;
import com.zcc.platform.event.service.EventInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author zcc
 */
@Service("eventInfoService")
public class EventInfoServiceImpl implements EventInfoService {

    @Autowired
    private EventInfoDao eventInfoDao;
    @Autowired
    private EventRelationDao eventRelationDao;

    /**
     * 保存事件
     *
     * @param eventInfoEntity eventInfoEntity
     * @return id
     */
    @Override
    public String save(EventInfoEntity eventInfoEntity, HttpServletRequest request) {
        UserInfoEntity currentPerson = ConstUtil.currentPerson(request);
        if (StringUtil.isValidStr(eventInfoEntity.getEventId())) {
            eventInfoEntity.setUpdateUserAccount(currentPerson.getUserName());
            eventInfoEntity.setUpdateTime(new Date());
            eventInfoDao.update(eventInfoEntity);
        } else {
            eventInfoEntity.setCreateTime(new Date());
            eventInfoEntity.setCreateUserAccount(currentPerson.getUserName());
            eventInfoDao.add(eventInfoEntity);
        }
        return eventInfoEntity.getEventId();
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

        if (StringUtil.isValidStr(StringUtil.safeToString(map.get("occurredTime")))) {
            map.put("beginTime", StringUtil.safeToString(map.get("occurredTime")).substring(0, 10));
            map.put("endTime", StringUtil.safeToString(map.get("occurredTime")).substring(StringUtil.safeToString(map.get("occurredTime")).length() - 10));
        }
        if (StringUtil.isValidStr(StringUtil.safeToString(map.get("settlementTime")))) {
            map.put("beginTime", StringUtil.safeToString(map.get("settlementTime")).substring(0, 10));
            map.put("endTime", StringUtil.safeToString(map.get("settlementTime")).substring(StringUtil.safeToString(map.get("occurredTime")).length() - 10));
        }
        return eventInfoDao.findByParamWithPage(map, page);
    }

    /**
     * 查找事件
     *
     * @param map map
     * @return list
     */
    @Override
    public List<EventInfoEntity> find(Map<String, Object> map) {
        if (StringUtil.isValidStr(StringUtil.safeToString(map.get("occurredTime")))) {
            map.put("beginTime", StringUtil.safeToString(map.get("occurredTime")).substring(0, 10));
            map.put("endTime", StringUtil.safeToString(map.get("occurredTime")).substring(StringUtil.safeToString(map.get("occurredTime")).length() - 10));
        }
        if (StringUtil.isValidStr(StringUtil.safeToString(map.get("settlementTime")))) {
            map.put("beginTime", StringUtil.safeToString(map.get("settlementTime")).substring(0, 10));
            map.put("endTime", StringUtil.safeToString(map.get("settlementTime")).substring(StringUtil.safeToString(map.get("occurredTime")).length() - 10));
        }
        return eventInfoDao.findByParam(map);
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
            if (StringUtil.isValidStr(byEventIdAndObjectId.getRelationName())) {
                eventRelationEntity.setRelationName(eventRelationEntity.getRelationName() + ";" + byEventIdAndObjectId.getRelationName());
            }
            eventRelationDao.updateEventRelationObject(eventRelationEntity.getEventId(), eventRelationEntity.getObjectId());
        }
        return eventRelationEntity.getEventId();
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
}
