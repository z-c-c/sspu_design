package com.zcc.platform.unit.service;

import com.zcc.commons.utils.Page;
import com.zcc.platform.unit.entity.UnitEntity;

import java.util.List;

/**
 * @author zcc
 */
public interface UnitService {

    /**
     * 保存单位
     *
     * @param unitEntity unitEntity
     * @param tags       tags
     * @return saved Id
     */
    String save(UnitEntity unitEntity, String tags);

    /**
     * 保存单位
     *
     * @param unitEntity unitEntity
     * @return savedId
     */
    String save(UnitEntity unitEntity);

    /**
     * 删除单位
     *
     * @param unitId unitId
     */
    void del(String unitId);

    /**
     * 查找单位
     *
     * @param unitId unitId
     * @return list
     */
    UnitEntity findById(String unitId);

    /**
     * 查找单位
     *
     * @param status 单位经营状态 1：在经营 0：不在经营
     * @return list
     */
    List<UnitEntity> findByStatus(String status);

    /**
     * 模糊查找
     * @param status  status
     * @param param 单位名称/单位行业/单位地址/单位法人
     * @return list
     */
    List<UnitEntity> find(String param, String status);

    /**
     * 模糊查找+标签查找
     * @param status status
     * @param param 单位名称/单位行业/单位地址/单位法人
     * @param tags  tags
     * @return list
     */
    List<UnitEntity> find(String param, String tags, String status);


    /**
     * 模糊查找+分页
     * @param status status
     * @param param 单位名称/单位行业/单位地址/单位法人
     * @param page  page
     * @return list
     */
    List<UnitEntity> find(String param, Page page, String status);

    /**
     * 模糊查找+标签查找+分页
     * @param status status
     * @param param 单位名称/单位行业/单位地址/单位法人
     * @param page  page
     * @param tags  tags
     * @return list
     */
    List<UnitEntity> find(String param, Page page, String tags, String status);

    /**
     * 数据聚合
     *
     * @param unitId unitId
     * @return list
     */
    List<UnitEntity> dataTogether(String unitId);


    /**
     * 数据聚合
     *
     * @param unitId unitId
     * @param page   page
     * @return list
     */
    List<UnitEntity> dataTogether(String unitId, Page page);

    /**
     * 数据聚合
     *
     * @return list
     */
    List<UnitEntity> dataTogether();

    /**
     * 数据聚合
     *
     * @param page page
     * @return list
     */
    List<UnitEntity> dataTogether(Page page);


}
