package com.zcc.commons.utils;

import com.zcc.manager.usermanager.entity.UserInfoEntity;

import javax.servlet.http.HttpServletRequest;

/**
 * @author zcc
 * 全局常量
 */
public class ConstUtil {

    public static final String CURRENT_PERSON = "currentPerson";
    public static final String LOGIN_JSP = "login.jsp";
    public static final String MANAGER_LOGIN_JSP = "managerLogin.jsp";
    public static final String CSS = ".css";
    public static final String JS = ".js";
    public static final String PNG = ".png";
    public static final String JPG = ".jpg";
    public static final String MP4 = ".mp4";
    public static final String JSP = "jsp";
    public static final String LOGIN_LOGIN = "login/login";
    public static final String NO_FLAG = "0";


    public static UserInfoEntity currentPerson(HttpServletRequest request) {
        return (UserInfoEntity) request.getSession().getAttribute(CURRENT_PERSON);
    }

}