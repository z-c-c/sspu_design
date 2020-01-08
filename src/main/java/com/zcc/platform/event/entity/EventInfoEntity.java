package com.zcc.platform.event.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author zcc
 */
public class EventInfoEntity implements Serializable {

    private String eventId;
    private String eventName;
    private String eventContent;
    private Date occurredTime;
    private String occurredPlace;
    /**
     * 经度
     */
    private String occurredLongti;
    /**
     * 维度
     */
    private String occurredLati;
    private String createUserAccount;
    private Date createTime;
    private Date updateTime;
    private String updateUserAccount;
    /**
     * 是否处理
     */
    private String isHandle;
    /**
     * 是否结算
     */
    private String isSettlement;
    private String settlementTime;
    private Integer linkPersonNo;
    private Integer linkUnitNo;
    private Integer linkEventNo;
    private String filePath;
    private String isDelete;


    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventContent() {
        return eventContent;
    }

    public void setEventContent(String eventContent) {
        this.eventContent = eventContent;
    }

    public Date getOccurredTime() {
        return occurredTime;
    }

    public void setOccurredTime(Date occurredTime) {
        this.occurredTime = occurredTime;
    }

    public String getOccurredPlace() {
        return occurredPlace;
    }

    public void setOccurredPlace(String occurredPlace) {
        this.occurredPlace = occurredPlace;
    }

    public String getOccurredLongti() {
        return occurredLongti;
    }

    public void setOccurredLongti(String occurredLongti) {
        this.occurredLongti = occurredLongti;
    }

    public String getOccurredLati() {
        return occurredLati;
    }

    public void setOccurredLati(String occurredLati) {
        this.occurredLati = occurredLati;
    }

    public String getCreateUserAccount() {
        return createUserAccount;
    }

    public void setCreateUserAccount(String createUserAccount) {
        this.createUserAccount = createUserAccount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getIsHandle() {
        return isHandle;
    }

    public void setIsHandle(String isHandle) {
        this.isHandle = isHandle;
    }

    public String getIsSettlement() {
        return isSettlement;
    }

    public void setIsSettlement(String isSettlement) {
        this.isSettlement = isSettlement;
    }

    public String getSettlementTime() {
        return settlementTime;
    }

    public void setSettlementTime(String settlementTime) {
        this.settlementTime = settlementTime;
    }

    public Integer getLinkPersonNo() {
        return linkPersonNo;
    }

    public void setLinkPersonNo(Integer linkPersonNo) {
        this.linkPersonNo = linkPersonNo;
    }

    public Integer getLinkUnitNo() {
        return linkUnitNo;
    }

    public void setLinkUnitNo(Integer linkUnitNo) {
        this.linkUnitNo = linkUnitNo;
    }

    public Integer getLinkEventNo() {
        return linkEventNo;
    }

    public void setLinkEventNo(Integer linkEventNo) {
        this.linkEventNo = linkEventNo;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getUpdateUserAccount() {
        return updateUserAccount;
    }

    public void setUpdateUserAccount(String updateUserAccount) {
        this.updateUserAccount = updateUserAccount;
    }
}
