package com.zcc.platform.relation.entity;

/**
 * @author zcc
 */
public class ObjectRelationEntity {

    private Long id;

    private String relationId;

    private String fromObjectId;
    private String fromObjectType;
    private String toObjectId;
    private String toObjectType;
    private String relationName;
    private String relationDetail;
    private String isDelete;


    public String getRelationId() {
        return relationId;
    }

    public void setRelationId(String relationId) {
        this.relationId = relationId;
    }

    public String getFromObjectId() {
        return fromObjectId;
    }

    public void setFromObjectId(String fromObjectId) {
        this.fromObjectId = fromObjectId;
    }

    public String getFromObjectType() {
        return fromObjectType;
    }

    public void setFromObjectType(String fromObjectType) {
        this.fromObjectType = fromObjectType;
    }

    public String getToObjectId() {
        return toObjectId;
    }

    public void setToObjectId(String toObjectId) {
        this.toObjectId = toObjectId;
    }

    public String getToObjectType() {
        return toObjectType;
    }

    public void setToObjectType(String toObjectType) {
        this.toObjectType = toObjectType;
    }

    public String getRelationName() {
        return relationName;
    }

    public void setRelationName(String relationName) {
        this.relationName = relationName;
    }

    public String getRelationDetail() {
        return relationDetail;
    }

    public void setRelationDetail(String relationDetail) {
        this.relationDetail = relationDetail;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }
}