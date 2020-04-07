package com.zcc.platform.event.dao;

import com.zcc.platform.event.entity.EventRelationEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
     * @return
     */
    List<EventRelationEntity> findByEventIdAndObjectType(@Param("eventId") String eventId, @Param("objectType") String objectType);

    /**
     * 修改关联关系
     *
     * @param eventId
     * @param objectId
     */
    void updateEventRelationObject(@Param("eventId") String eventId, @Param("objectId") String objectId, @Param("relationName") String relationName);

}
