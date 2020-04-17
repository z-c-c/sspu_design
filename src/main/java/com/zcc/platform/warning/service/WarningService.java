package com.zcc.platform.warning.service;

import com.zcc.commons.utils.Page;
import com.zcc.platform.warning.entity.WarningEntity;

import java.util.List;

/**
 * @author zcc
 */
public interface WarningService {

    /**
     * 保存预警
     *
     * @param warningEntity warningEntity
     * @return noticeId
     */
    String saveWarning(WarningEntity warningEntity);

    /**
     * 删除预警
     *
     * @param noticeId warningId
     */
    void delWarningById(String noticeId);

    /**
     * 删除预警
     *
     * @param noticeType noticeType
     */
    void delWarningByType(String noticeType);

    /**
     * 删除预警
     *
     * @param noticeObjectType
     * @param noticeObjectId
     */
    void delWarningForObject(String noticeObjectType, String noticeObjectId);


    /**
     * 查找预警
     *
     * @param noticeId warningId
     * @return WarningEntity
     */
    WarningEntity findWarningById(String noticeId);

    /**
     * 查找预警
     *
     * @param noticeName       预警名称
     * @param noticeObjectType unit/person/event
     * @param begin            预警开始时间 yyyy-MM-dd
     * @param end              预警结束时间 yyyy-MM-dd
     * @param tags             预警标签
     * @return list
     */
    List<WarningEntity> findWarning(String noticeName, String noticeObjectType, String begin, String end, String tags);


    /**
     * 查找预警
     *
     * @param noticeName 预警名称
     * @param noticeType 自动/手动
     * @param begin      预警开始时间 yyyy-MM-dd
     * @param end        预警结束时间 yyyy-MM-dd
     * @param tags       预警标签
     * @param page       page
     * @return list
     */
    List<WarningEntity> findWarning(String noticeName, String noticeType, String begin, String end, String tags, Page page);

    /**
     * 查找预警
     *
     * @param noticeType 自动/手动
     * @return list
     */
    List<WarningEntity> findWarningByType(String noticeType);

    /**
     * 查找预警
     *
     * @param noticeObjectId   预警对象Id
     * @param noticeObjectType 预警对象Type
     * @return
     */
    WarningEntity findWarningByNoticeObjectIdAndType(String noticeObjectId, String noticeObjectType);

    /**
     * 查找预警
     *
     * @return list
     */
    List<WarningEntity> findAll();

    /**
     * 查找预警
     *
     * @param page page
     * @return
     */
    List<WarningEntity> findAll(Page page);

    /**
     * 事件自动预警
     * 该事件近一个15天有5条以上处置日志，且该事件未结算，自动添加预警，预警等级 较严重（3）
     */
    void autoEventWarning();

    /**
     * 人员自动预警
     * 该人员近15天参与了5件以上事件，自动添加预警，预警等级 较严重（3）
     */
    void autoPersonWarning();

    /**
     * 单位自动预警
     * 该单位近15天参与了5件以上事件，自动添加预警，预警等级 较严重(3)
     */
    void autoUnitWarning();

    /**
     * 自动预警
     */
    void autoWarning();

}
