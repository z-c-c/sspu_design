package com.zcc.commons.utils;

import java.util.Collection;

/**
 * @author zcc
 * 统一 返回结果集
 */
public class ResultBean<T> {

    /**
     * 成功返回码
     */
    public static final String SUCCESS="success";
    /**
     * 系统错误返回码
     */
    public static final String ERROR="error";
    /**
     * 用户操作造成的错误返回码
     */
    public static final String WARNING="warning";
    /**
     * 状态码
     */
    private String code;
    /**
     * 状态信息
     */
    private String message;
    /**
     * 返回数据
     */
    private T data;

    private ResultBean() {

    }

    public static ResultBean error(String code, String message) {
        ResultBean resultBean = new ResultBean();
        resultBean.setCode(code);
        resultBean.setMessage(message);
        return resultBean;
    }

    public static ResultBean success() {
        ResultBean resultBean = new ResultBean();
        resultBean.setCode(ResultBean.SUCCESS);
        resultBean.setMessage("success");
        return resultBean;
    }

    public static<T> ResultBean<T> success(T data) {
        ResultBean resultBean = new ResultBean();
        resultBean.setCode(ResultBean.SUCCESS);
        resultBean.setMessage("success");
        resultBean.setData(data);
        return resultBean;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}