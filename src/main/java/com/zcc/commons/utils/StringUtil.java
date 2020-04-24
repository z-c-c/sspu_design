package com.zcc.commons.utils;

/**
 * @author zcc
 * 字符串工具
 */
public class StringUtil {

    public static boolean isValidStr(String str) {
        return str != null && !"".equals(str);
    }

    /**
     * 转换为String
     *
     * @param object object
     * @return String
     */
    public static String safeToString(Object object) {
        if (object == null) {
            return "";
        }
        try {
            return String.valueOf(object);
        } catch (Exception e) {
            return "";
        }
    }
}
