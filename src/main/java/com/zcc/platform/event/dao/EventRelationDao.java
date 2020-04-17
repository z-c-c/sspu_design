package com.zcc.platform.event.dao;

import com.zcc.platform.event.entity.EventInfoEntity;
import com.zcc.platform.event.entity.EventRelationEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @author zcc
 */
@Repository
public interface EventRelationDao {

    /**
     * 添加事件关联对象
     *
     * @param eventRelationEntity eventRelationEntity
     */
    void addEventRelationObject(EventRelationEntity eventRelationEntity);

    /**
     * 删除事件关联对象
     *
     * @param eventId  eventId
     * @param objectId objectId
     */
    void delEventRelationObject(@Param("eventId") String eventId, @Param("objectId") String objectId);

    /**
     * 删除事件关联对象
     *
     * @param eventId    eventId
     * @param objectType objectType
     */
    void delEventRelationType(@Param("eventId") String eventId, @Param("objectType") String objectType);

    /**
     * 查找指定的关联对象
     *
     * @param eventId  eventId
     * @param objectId objectId
     * @return EventRelationEntity
     */
    EventRelationEntity findByEventIdAndObjectId(@Param("eventId") String eventId, @Param("objectId") String objectId);

    /**
     * 查找事件关联对象
     *
     * @param eventId    eventId
     * @param objectType objectType
     * @return list
     */
    List<EventRelationEntity> findByEventIdAndObjectType(@Param("eventId") String eventId, @Param("objectType") String objectType);

    /**
     * 查找事件关联人员
     *
     * @param eventId eventId
     * @return list<Map>
     */
    List findEventLinkPerson(String eventId);

    /**
     * 查找事件关联单位
     *
     * @param eventId
     * @return
     */
    List findEventLinkUnit(String eventId);

    /**
     * 查找对象关联的事件
     *
     * @param objectId   objectId
     * @param objectType objectType
     * @return list<EventInfoEntity>
     */
    List<EventInfoEntity> findObjectLinkEvent(@Param("objectId") String objectId, @Param("objectType") String objectType);

    /**
     * 修改关联关系
     *
     * @param relationTime
     * @param eventId
     * @param objectId
     */
    void updateEventRelationObject(@Param("eventId") String eventId, @Param("objectId") String objectId, @Param("relationTime") Date relationTime);

}
