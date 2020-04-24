package com.zcc.commons.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author zcc
 * 时间处理工具类
 */
public class TimeUtil {
    /**
     * 获取一个月的第一天
     *
     * @param date eg:2020-01
     * @return Date
     */
    public static Date getMonthFirstDay(String date) {
        DateFormat format = new SimpleDateFormat("yyyy-MM");
        Calendar instance = Calendar.getInstance();
        try {
            Date parse = format.parse(date);
            instance.setTime(parse);
            instance.add(Calendar.MONTH, 0);
            instance.set(Calendar.DAY_OF_MONTH, 1);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return instance.getTime();
    }

    /**
     * 获取指定日期的几个月前的第一天
     *
     * @param index index
     * @param date  yyyy-MM
     * @return String
     */
    public static String getBeforeMonthFirstDay(String date, int index) {
        return getDateStr("yyyy-MM-dd HH:mm:ss", getBeforeMonthFirstDaytoDate(date, index));
    }

    /**
     * 获取指定日期的几个月前的第一天
     *
     * @param index index
     * @param date  yyyy-MM
     * @return Date
     */
    public static Date getBeforeMonthFirstDaytoDate(String date, int index) {
        DateFormat format = new SimpleDateFormat("yyyy-MM");
        Calendar instance = Calendar.getInstance();
        try {
            Date parse = format.parse(date);
            instance.setTime(parse);
            instance.add(Calendar.MONTH, -index);
            instance.set(Calendar.DAY_OF_MONTH, 1);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return instance.getTime();
    }


    /**
     * 获取一个月的最后一天的最后一刻
     *
     * @param date eg:2020-01
     * @return 2020-01-31 23:59:59.999
     */
    public static Date getMonthEndDay(String date) {
        DateFormat format = new SimpleDateFormat("yyyy-MM");
        Calendar instance = Calendar.getInstance();
        try {
            Date parse = format.parse(date);
            instance.setTime(parse);
            instance.set(Calendar.DAY_OF_MONTH, instance.getActualMaximum(Calendar.DAY_OF_MONTH));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        long timeInMillis = instance.getTimeInMillis() + 86399999L;
        return new Date(timeInMillis);
    }

    /**
     * 获取指定日期几个月前月的最后一刻
     *
     * @param index index
     * @param date yyyy-MM
     * @return Date
     */
    public static Date getBeforeMonthEndDay(String date, int index) {
        DateFormat format = new SimpleDateFormat("yyyy-MM");
        Calendar instance = Calendar.getInstance();
        try {
            Date parse = format.parse(date);
            instance.setTime(parse);
            instance.set(Calendar.MONTH, instance.get(Calendar.MONTH) - index);
            instance.set(Calendar.DAY_OF_MONTH, instance.getActualMaximum(Calendar.DAY_OF_MONTH));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return new Date(instance.getTimeInMillis() + 86399999L);
    }

    /**
     * 获取指定格式的时间字符串形式
     *
     * @param format 时间格式
     * @param date   时间
     * @return String
     */
    public static String getDateStr(String format, Date date) {
        if (date == null) {
            date = new Date();
        }
        SimpleDateFormat formatter = new SimpleDateFormat(format);
        String dateStr = formatter.format(date);
        return dateStr;
    }

    /**
     * 获取指定日期的前几个月的格式化信息
     *
     * @param date   指定日期 yyyy-MM
     * @param index  几个月前
     * @param format 指定格式
     */
    public static List<String> getMonthBeforeFormat(String date, int index, String format) {
        List<String> dateList = new ArrayList<>(6);
        if (index == 0) {
            dateList.add(getDateStr(format, new Date()));
        }
        //几个月前
        else if (index > 0) {
            for (int i = 0; i <= index; i++) {
                dateList.add(getDateStr(format, getBeforeMonthFirstDaytoDate(date, i)));
            }
        }
        //几个月后
        else {
            for (int i = index; i <= 0; i++) {
                dateList.add(getDateStr(format, getBeforeMonthFirstDaytoDate(date, i)));
            }
        }
        return dateList;
    }


    /**
     * 获取过去n天的时间
     *
     * @param index index
     * @return Date
     */
    public static Date getDayBefore(int index) {
        LocalDateTime now = LocalDateTime.now();
        now = now.minus(index, ChronoUnit.DAYS);
        return Date.from(now.atZone(ZoneId.systemDefault()).toInstant());
    }

    /**
     * 获取过去n天的日期格式化后的List
     *
     * @param index index
     * @return List
     */
    public static List<String> getDayBeforeFormat(int index, String format) {
        List<String> dateList = new ArrayList<>(7);
        if (index == 0) {
            dateList.add(getDateStr(format, new Date()));
        } else if (index > 0) {
            for (int i = 0; i < index; i++) {
                dateList.add(getDateStr(format, getDayBefore(i)));
            }

        } else {
            for (int i = index; i <= 0; i++) {
                dateList.add(getDateStr(format, getDayBefore(i)));
            }
        }

        return dateList;
    }
}
