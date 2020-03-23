package com.zcc.platform.event.entity;

import java.util.Date;

/**
 * @author zcc
 */
public class HandleLogEntity {
    private Integer handleLogId;
    private String handleEventId;
    private String handleContent;
    private Date handleDate;
    private String handleUser;
    private String handleFilePath;
    private Date handleCreateTime;
    private String handleCreateUser;
    private String handleUnit;
    private String handlePass;
    private String isDelete;

    public Integer getHandleLogId() {
        return handleLogId;
    }


    public void setHandleLogId(Integer handleLogId) {
        this.handleLogId = handleLogId;
    }

    public String getHandleEventId() {
        return handleEventId;
    }

    public void setHandleEventId(String handleEventId) {
        this.handleEventId = handleEventId;
    }

    public String getHandleContent() {
        return handleContent;
    }

    public void setHandleContent(String handleContent) {
        this.handleContent = handleContent;
    }

    public Date getHandleDate() {
        return handleDate;
    }

    public void setHandleDate(Date handleDate) {
        this.handleDate = handleDate;
    }

    public String getHandleUser() {
        return handleUser;
    }

    public void setHandleUser(String handleUser) {
        this.handleUser = handleUser;
    }

    public String getHandleFilePath() {
        return handleFilePath;
    }

    public void setHandleFilePath(String handleFilePath) {
        this.handleFilePath = handleFilePath;
    }

    public Date getHandleCreateTime() {
        return handleCreateTime;
    }

    public void setHandleCreateTime(Date handleCreateTime) {
        this.handleCreateTime = handleCreateTime;
    }

    public String getHandleCreateUser() {
        return handleCreateUser;
    }

    public void setHandleCreateUser(String handleCreateUser) {
        this.handleCreateUser = handleCreateUser;
    }

    public String getHandleUnit() {
        return handleUnit;
    }

    public void setHandleUnit(String handleUnit) {
        this.handleUnit = handleUnit;
    }

    public String getHandlePass() {
        return handlePass;
    }

    public void setHandlePass(String handlePass) {
        this.handlePass = handlePass;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }
}
