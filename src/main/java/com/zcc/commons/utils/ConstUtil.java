package com.zcc.commons.utils;

import com.zcc.manager.usermanager.entity.UserInfoEntity;

import javax.servlet.http.HttpServletRequest;

/**
 * @author zcc
 * 全局常量
 */
public class ConstUtil {

    public static final String CURRENT_PERSON = "currentPerson";
    public static final String USER_TYPE = "userType";
    public static final String USER_TYPE_ONE = "1";
    public static final String USER_TYPE_ZERO = "0";
    public static final String LOGIN_JSP = "/login";
    public static final String KEY = "/key";
    public static final String MANAGER_LOGIN_JSP = "/managerLogin";
    public static final String CSS = ".css";
    public static final String JS = ".js";
    public static final String PNG = ".png";
    public static final String JPG = ".jpg";
    public static final String MP4 = ".mp4";
    public static final String JSP = "jsp";
    public static final String LOGIN_LOGIN = "login/login";
    public static final String NO_FLAG = "0";
    public static final String PERSON_TAG = "person";
    public static final String EVENT_TAG = "event";
    public static final String UNIT_TAG = "unit";
    public static final String TAGS = "tags";

    public static UserInfoEntity currentPerson(HttpServletRequest request) {
        return (UserInfoEntity) request.getSession().getAttribute(CURRENT_PERSON);
    }

}
