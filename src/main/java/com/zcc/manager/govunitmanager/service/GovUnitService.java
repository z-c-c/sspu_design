package com.zcc.manager.govunitmanager.service;

import com.zcc.commons.utils.Page;
import com.zcc.manager.govunitmanager.entity.GovUnitEntity;
import com.zcc.manager.govunitmanager.entity.GovUnitRelation;

import java.util.List;

/**
 * @author zcc
 */
public interface GovUnitService {

    /**
     * 添加政府部门
     *
     * @param govUnitEntity govUnit
     * @return Id
     */
    Integer add(GovUnitEntity govUnitEntity);

    /**
     * 删除政府部门
     *
     * @param id id
     */
    void delete(int id);

    /**
     * 修改政府部门
     * @param govUnitEntity  govUnitEntity
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
     * 添加关联事件
     *
     * @param govUnitRelation relation
     */
    void addGovRelation(List<GovUnitRelation> govUnitRelation);

    /**
     * 删除事件的责任单位
     *
     * @param  eventId eventId
     */
    void delGovRelation(String eventId);

    /**
     * 查找事件的责任单位
     *
     * @param eventId eventId
     * @param type 主办/委办
     * @return GovUnitEntity
     */
    GovUnitEntity findGovRelationUnit(String eventId, String type);
}
