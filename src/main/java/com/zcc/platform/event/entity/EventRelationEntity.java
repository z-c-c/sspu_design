package com.zcc.platform.event.entity;

import java.util.Date;

/**
 * @author zcc
 * 事件关联对象表
 */
public class EventRelationEntity {

    public static final String OBJECT_TYPE_PERSON = "person";
    public static final String OBJECT_TYPE_UNIT = "unit";
    public static final String OBJECT_TYPE_EVENT = "event";

    private String relationListId;
    private String eventId;
    private String objectId;
    private String objectType;
    private Date relationTime;
    private String isDelete;


    public String getRelationListId() {
        return relationListId;
    }

    public void setRelationListId(String relationListId) {
        this.relationListId = relationListId;
    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public String getObjectId() {
        return objectId;
    }

    public void setObjectId(String objectId) {
        this.objectId = objectId;
    }

    public String getObjectType() {
        return objectType;
    }

    public void setObjectType(String objectType) {
        this.objectType = objectType;
    }

    public Date getRelationTime() {
        return relationTime;
    }

    public void setRelationTime(Date relationTime) {
        this.relationTime = relationTime;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }
}
