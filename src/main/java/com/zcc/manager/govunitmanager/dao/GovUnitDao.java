package com.zcc.manager.govunitmanager.dao;

import com.zcc.commons.utils.Page;
import com.zcc.manager.govunitmanager.entity.GovUnitEntity;
import com.zcc.manager.govunitmanager.entity.GovUnitRelation;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author zcc
 */
@Repository
public interface GovUnitDao {
    /**
     * 添加政府部门
     *
     * @param govUnitEntity govUnit
     * @return
     */
    Integer add(GovUnitEntity govUnitEntity);

    /**
     * 删除政府部门
     *
     * @param id
     */
    void delete(int id);

    /**
     * 修改政府部门
     */
    void update(GovUnitEntity govUnitEntity);

    /**
     * 查找政府部门
     *
     * @return list
     */
    List<GovUnitEntity> findAll();

    /**
     * 查找政府部门
     *
     * @param page page
     * @return list
     */
    List<GovUnitEntity> findAllWithPage(Page page);

    /**
     * 添加事件责任单位
     *
     * @param govUnitRelation relation
     */
    void addGovRelation(GovUnitRelation govUnitRelation);

    /**
     * 删除事件的责任单位
     *
     * @param eventId
     */
    void delGovRelation(String eventId);

    /**
     * 查找事件的责任单位
     *
     * @param eventId
     * @return
     */
    GovUnitEntity findGovRelationUnit(@Param("eventId") String eventId, @Param("type") String type);
}
