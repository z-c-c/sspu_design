package com.zcc.manager.govunitmanager.entity;

/**
 * @author zcc
 */
public class GovUnitRelation {
    private Integer relationId;
    private String eventId;
    private Integer govUnitId;
    private String isDelete;
    private String type;

    public Integer getRelationId() {
        return relationId;
    }

    public void setRelationId(Integer relationId) {
        this.relationId = relationId;
    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public Integer getGovUnitId() {
        return govUnitId;
    }

    public void setGovUnitId(Integer govUnitId) {
        this.govUnitId = govUnitId;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
