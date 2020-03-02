package com.zcc.platform.event.dao;

import com.zcc.commons.utils.Page;
import com.zcc.platform.event.entity.EventInfoEntity;
import com.zcc.platform.event.entity.EventRelationEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author zcc
 */
@Repository("eventInfoDao")
public interface EventInfoDao {
    /**
     * 添加事件
     *
     * @param eventInfoEntity eventInfoEntity
     */
    void add(EventInfoEntity eventInfoEntity);

    /**
     * 删除事件
     *
     * @param eventId           eventId
     * @param updateTime        删除时间
     * @param updateUserAccount 操作人
     */
    void del(@Param("eventId") String eventId, @Param("updateTime") String updateTime, @Param("updateUserAccount") String updateUserAccount);

    /**
     * 修改事件
     *
     * @param eventInfoEntity eventInfoEntity
     */
    void update(EventInfoEntity eventInfoEntity);

    /**
     * 查找所有事件
     *
     * @return list
     */
    List<EventInfoEntity> findAll();


    /**
     * 根据id查找事件
     *
     * @param eventId eventId
     * @return EventInfoEntity
     */
    EventInfoEntity findById(String eventId);

    /**
     * 查找事件
     *
     * @param map  map
     * @param page page
     * @return list
     */
    List<EventInfoEntity> findByParamWithPage(@Param("Map") Map<String, Object> map, @Param("Page") Page page);

    /**
     * 查找事件（标签）
     *
     * @param map
     * @param page
     * @return list
     */
    List<EventInfoEntity> findByParamWithTag(@Param("Map") Map<String, Object> map, @Param("Page") Page page);

    /**
     * 查找事件
     *
     * @param map map
     * @return list
     */
    List<EventInfoEntity> findByParam(@Param("Map") Map<String, Object> map);

    /**
     * 单个事件的数据聚合,分页
     *
     * @param eventId eventId
     * @param page    page
     * @return list
     */
    List<EventInfoEntity> findDataTogetherByIdWithPage(@Param("eventId") String eventId, @Param("Page") Page page);

    /**
     * 单个事件的所有数据聚合
     *
     * @param eventId eventId
     * @return list
     */
    List<EventInfoEntity> findDataTogetherById(String eventId);

    /**
     * 所有事件的数据聚合、分页
     *
     * @param page page
     * @return list
     */
    List<EventInfoEntity> findAllDataTogetherWithPage(Page page);

    /**
     * 所有事件的数据聚合
     *
     * @return list
     */
    List<EventInfoEntity> findAllDataTogether();

}
