package com.zcc.commons.utils;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * @author zcc
 */
public class MD5 {

    public static final String SOIL = "@3d823?>!@#!DA980¥……l03；。SDF@D¥S@@#C；oe·wfdf、QS~@E@$#${{";

    /**
     * 加密
     *
     * @param text 加密前
     * @param key  密钥
     * @return 加密后
     */
    public static String md5(String text, String key) {
        return DigestUtils.md5Hex(text + key);
    }

    /**
     * 验证
     *
     * @param text 明文
     * @param key  密钥
     * @param md5  密文
     * @return
     */
    public static boolean verify(String text, String key, String md5) {
        String s = md5(text, key);
        if (s.equalsIgnoreCase(md5)) {
            return true;
        }
        return false;
    }
}
