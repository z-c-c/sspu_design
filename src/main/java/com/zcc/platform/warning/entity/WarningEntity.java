package com.zcc.platform.warning.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 预警表(WarningInfo)实体类
 *
 * @author makejava
 * @since 2020-04-09 12:11:52
 */
public class WarningEntity implements Serializable {
    private static final long serialVersionUID = -75232910262908039L;

    /**
     * 预警ID
     */
    private String noticeId;
    /**
     * 预警名称
     */
    private String noticeName;
    /**
     * 预警内容
     */
    private String noticeContent;
    /**
     * 预警类别
     */
    private String noticeType;
    /**
     * 预警等级
     */
    private String noticeLevel;
    /**
     * 预警时间
     */
    private Date noticeDate;
    /**
     * 预警地点
     */
    private String noticeAddr;
    /**
     * 经度
     */
    private String noticeLongi;
    /**
     * 维度
     */
    private String noticeLati;
    /**
     * 预警对象名称
     */
    private String noticeObjectName;
    /**
     * 预警对象类别
     */
    private String noticeObjectType;
    /**
     * 预警对象ID
     */
    private String noticeObjectId;
    /**
     * 预警标签
     */
    private Object warningTags;


    public String getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(String noticeId) {
        this.noticeId = noticeId;
    }

    public String getNoticeName() {
        return noticeName;
    }

    public void setNoticeName(String noticeName) {
        this.noticeName = noticeName;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }

    public String getNoticeType() {
        return noticeType;
    }

    public void setNoticeType(String noticeType) {
        this.noticeType = noticeType;
    }

    public String getNoticeLevel() {
        return noticeLevel;
    }

    public void setNoticeLevel(String noticeLevel) {
        this.noticeLevel = noticeLevel;
    }

    public Date getNoticeDate() {
        return noticeDate;
    }

    public void setNoticeDate(Date noticeDate) {
        this.noticeDate = noticeDate;
    }

    public String getNoticeAddr() {
        return noticeAddr;
    }

    public void setNoticeAddr(String noticeAddr) {
        this.noticeAddr = noticeAddr;
    }

    public String getNoticeLongi() {
        return noticeLongi;
    }

    public void setNoticeLongi(String noticeLongi) {
        this.noticeLongi = noticeLongi;
    }

    public String getNoticeLati() {
        return noticeLati;
    }

    public void setNoticeLati(String noticeLati) {
        this.noticeLati = noticeLati;
    }

    public String getNoticeObjectName() {
        return noticeObjectName;
    }

    public void setNoticeObjectName(String noticeObjectName) {
        this.noticeObjectName = noticeObjectName;
    }

    public String getNoticeObjectType() {
        return noticeObjectType;
    }

    public void setNoticeObjectType(String noticeObjectType) {
        this.noticeObjectType = noticeObjectType;
    }

    public String getNoticeObjectId() {
        return noticeObjectId;
    }

    public void setNoticeObjectId(String noticeObjectId) {
        this.noticeObjectId = noticeObjectId;
    }

    public Object getWarningTags() {
        return warningTags;
    }

    public void setWarningTags(Object warningTags) {
        this.warningTags = warningTags;
    }

    /**
     * 预警对象类别
     */
    public static final String WARNING_PERSON = "person";
    public static final String WARNING_UNIT = "unit";
    public static final String WARNING_EVENT = "event";
    /**
     * 预警级别：轻度
     */
    public static final String LEVEL_ONE = "1";
    /**
     * 预警级别：一般
     */
    public static final String LEVEL_TWO = "2";
    /**
     * 预警级别：较严重
     */
    public static final String LEVEL_THREE = "3";
    /**
     * 预警级别：严重
     */
    public static final String LEVEL_FOUR = "4";

    public static final String AUTO = "自动";
    public static final String UN_AUTO = "手动";

}