package com.zcc.platform.event.service;

import com.zcc.commons.utils.Page;
import com.zcc.platform.event.entity.EventInfoEntity;
import com.zcc.platform.event.entity.EventRelationEntity;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author zcc
 */
public interface EventInfoService {

    /**
     * 保存事件
     *
     * @param eventInfoEntity eventInfoEntity
     * @param request         request
     * @param tags            tags
     * @param linkPersonNos   linkPersonNos
     * @param linkUnitNos     linkUnitNos
     * @param linkEventNos    linkEventNos
     * @return id
     */
    String save(EventInfoEntity eventInfoEntity, HttpServletRequest request, String tags, String linkPersonNos, String linkUnitNos, String linkEventNos);

    /**
     * 删除事件
     *
     * @param eventId id
     * @param request request
     */
    void del(String eventId, HttpServletRequest request);

    /**
     * 查找
     *
     * @return list
     */
    List<EventInfoEntity> findAll();

    /**
     * 根据id查找事件
     *
     * @param eventId eventId
     * @return EventInfoEntity
     */
    EventInfoEntity find(String eventId);

    /**
     * 查找事件
     *
     * @param map  map
     * @param page page
     * @return list
     */
    List<EventInfoEntity> find(Map<String, Object> map, Page page);

    /**
     * 查找事件
     *
     * @param map map
     * @return list
     */
    List<EventInfoEntity> find(Map<String, Object> map);

    /**
     * 添加事件关联对象
     *
     * @param eventRelationEntity eventRelationEntity
     * @return id
     */
    String addEventRelationObject(EventRelationEntity eventRelationEntity);

    /**
     * 删除事件关联对象
     *
     * @param eventId  eventId
     * @param objectId objectId
     */
    void delEventRelationObject(String eventId, String objectId);

    /**
     * 单个事件的数据聚合,分页
     *
     * @param eventId eventId
     * @param page    page
     * @return list
     */
    List<EventInfoEntity> findDataTogether(String eventId, Page page);

    /**
     * 单个事件的所有数据聚合
     *
     * @param eventId eventId
     * @return list
     */
    List<EventInfoEntity> findDataTogether(String eventId);

    /**
     * 所有事件的数据聚合、分页
     *
     * @param page page
     * @return list
     */
    List<EventInfoEntity> findDataTogether(Page page);

    /**
     * 所有事件的数据聚合
     *
     * @return list
     */
    List<EventInfoEntity> findDataTogether();

}
