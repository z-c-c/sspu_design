package com.zcc.platform.unit.dao;

import com.zcc.commons.utils.Page;
import com.zcc.platform.unit.entity.UnitEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author zcc
 */
@Repository
public interface UnitDao {
    /**
     * 添加单位
     *
     * @param unitEntity unitEntity
     */
    void addUnit(UnitEntity unitEntity);

    /**
     * 删除单位
     *
     * @param unitId unitId
     */
    void delUnit(String unitId);

    /**
     * 修改单位
     *
     * @param unitEntity unitEntity
     */
    void updateUnit(UnitEntity unitEntity);

    /**
     * 查找所有单位
     *
     * @return
     */
    List<UnitEntity> findAll();

    /**
     * 查找单位
     *
     * @param unitId unitId
     * @return UnitEntity
     */
    UnitEntity findUnitById(String unitId);

    /**
     * 查找单位 （是否在经营）
     *
     * @param status 1：在经营。0：停止经营
     * @return list
     */
    List<UnitEntity> findUnitByStatus(String status);

    /**
     * 模糊查找:单位名称/单位行业/单位地址/单位法人
     *
     * @param param param
     * @param status  status
     * @return list
     */
    List<UnitEntity> findUnit(@Param("param") String param, @Param("status") String status);

    /**
     * 模糊查找+标签查找
     *
     * @param param param
     * @param tags  tags
     * @param status status
     * @return list
     */
    List<UnitEntity> findUnitWithTag(@Param("param") String param, @Param("tags") List<String> tags, @Param("status") String status);

    /**
     * 模糊查找+分页
     * @param status status
     * @param param param
     * @param page  page
     * @return list
     */
    List<UnitEntity> findUnitWithPage(@Param("param") String param, @Param("page") Page page, @Param("status") String status);

    /**
     * 模糊查找+标签查找+分页
     *
     * @param param param
     * @param page  page
     * @param tags  tags
     * @param status status
     * @return list
     */
    List<UnitEntity> findUnitWithPageAndTag(@Param("param") String param, @Param("page") Page page, @Param("tags") List<String> tags, @Param("status") String status);

    /**
     * 数据聚合
     * 单个单位的数据聚合
     *
     * @param unitId unitId
     * @return list
     */
    List<UnitEntity> dataTogether(String unitId);

    /**
     * 数据聚合
     * 单个单位的数据聚合分页查找
     *
     * @param unitId unitId
     * @param page   page
     * @return list
     */
    List<UnitEntity> dataTogetherWithPage(@Param("unitId") String unitId, @Param("page") Page page);

    /**
     * 数据聚合
     * 这是所有单位的数据聚合
     *
     * @return list
     */
    List<UnitEntity> dataTogetherAll();

    /**
     * 数据聚合
     * 所有单位的数据聚合 分页查找
     *
     * @param page page
     * @return list
     */
    List<UnitEntity> dataTogetherAllWithPage(@Param("page") Page page);
}
