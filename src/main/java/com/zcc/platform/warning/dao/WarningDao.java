package com.zcc.platform.warning.dao;

import com.zcc.commons.utils.Page;
import com.zcc.platform.event.entity.EventInfoEntity;
import com.zcc.platform.person.entity.PersonEntity;
import com.zcc.platform.unit.entity.UnitEntity;
import com.zcc.platform.warning.entity.WarningEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @author zcc
 */
@Repository
public interface WarningDao {
    /**
     * 添加预警
     *
     * @param warningEntity warningEntity
     */
    void addWarning(WarningEntity warningEntity);

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
     * 修改预警
     *
     * @param warningEntity warningEntity
     */
    void updateWarning(WarningEntity warningEntity);

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
     * @param noticeName 预警名称
     * @param noticeType 自动/手动
     * @param begin      预警开始时间 yyyy-MM-dd
     * @param end        预警结束时间 yyyy-MM-dd
     * @param tags       预警标签
     * @return list
     */
    List<WarningEntity> findWarning(@Param("noticeName") String noticeName, @Param("noticeType") String noticeType, @Param("beginTime") String begin, @Param("endTime") String end, @Param("tags") List<String> tags);


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
    List<WarningEntity> findWarningWithPage(@Param("noticeName") String noticeName, @Param("noticeType") String noticeType, @Param("beginTime") String begin, @Param("endTime") String end, @Param("tags") List<String> tags, @Param("page") Page page);

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
     * @param noticeObjectId   预警对象ID
     * @param noticeObjectType 预警对象Type
     * @return warningEntity
     */
    WarningEntity findWarningByNoticeObjectIdAndType(@Param("noticeObjectId") String noticeObjectId, @Param("noticeObjectType") String noticeObjectType);

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
     * @return list
     */
    List<WarningEntity> findAllWithPage(Page page);

    /**
     * 自动预警事件
     *
     * @param fromDate fromDate
     * @return list
     */
    List<EventInfoEntity> autoWarningEvent(Date fromDate);

    /**
     * 自动预警人员
     *
     * @param fromDate fromDate
     * @return list
     */
    List<PersonEntity> autoWarningPerson(Date fromDate);

    /**
     * 自动预警单位
     *
     * @param fromDate fromDate
     * @return list
     */
    List<UnitEntity> autoWarningUnit(Date fromDate);


}
