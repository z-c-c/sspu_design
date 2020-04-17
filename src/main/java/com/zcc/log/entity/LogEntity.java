package com.zcc.log.entity;

import java.io.Serializable;

/**
 * @author zcc
 */
public class LogEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 日志类型
     */
    public static final String SUCCESS = "success";
    public static final String ERROR = "error";

    /**
     * 日志主键
     */
    private String logId;
    /**
     * 接口访问结果
     */
    private String result;
    /**
     * 接口上LOG标签的name值
     */
    private String name;
    /**
     * 请求地址
     */
    private String remoteAddr;
    /**
     * URI
     */
    private String requestUri;
    /**
     * 请求方式
     */
    private String method;
    /**
     * 提交参数
     */
    private String params;
    /**
     * 异常
     */
    private String exception;
    /**
     * 开始时间
     */
    private String operateTime;
    /**
     * 结束时间
     */
    private String endTime;
    /**
     * 用户ID
     */
    private String userId;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemoteAddr() {
        return remoteAddr;
    }

    public void setRemoteAddr(String remoteAddr) {
        this.remoteAddr = remoteAddr;
    }

    public String getRequestUri() {
        return requestUri;
    }

    public void setRequestUri(String requestUri) {
        this.requestUri = requestUri;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public String getException() {
        return exception;
    }

    public void setException(String exception) {
        this.exception = exception;
    }

    public String getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(String operateTime) {
        this.operateTime = operateTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
