package com.zcc.commons.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author zcc
 */
public class DateFormat {

    public final static String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd hh:mm:ss";
    public final static String YYYY_MM_DD = "yyyy-MM-dd";

    public static String dataFormat(Date date, String formatType) {
        SimpleDateFormat format;
        if (DateFormat.YYYY_MM_DD_HH_MM_SS.equals(formatType)) {
            format = new SimpleDateFormat(formatType);
            return format.format(date);
        } else if (DateFormat.YYYY_MM_DD.equals(formatType)) {
            format = new SimpleDateFormat(formatType);
            return format.format(date);
        } else {
            return "";
        }
    }
}
