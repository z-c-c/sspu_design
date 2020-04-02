package com.zcc.platform.unit.dao;

import com.zcc.platform.unit.entity.UnitEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (UnitInfo)表数据库访问层
 *
 * @author makejava
 * @since 2020-04-02 11:31:00
 */
public interface UnitInfoDao {

    /**
     * 通过ID查询单条数据
     *
     * @param unitId 主键
     * @return 实例对象
     */
    UnitEntity queryById(String unitId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<UnitEntity> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param unitEntity 实例对象
     * @return 对象列表
     */
    List<UnitEntity> queryAll(UnitEntity unitEntity);

    /**
     * 新增数据
     *
     * @param unitEntity 实例对象
     * @return 影响行数
     */
    int insert(UnitEntity unitEntity);

    /**
     * 修改数据
     *
     * @param unitEntity 实例对象
     * @return 影响行数
     */
    int update(UnitEntity unitEntity);

    /**
     * 通过主键删除数据
     *
     * @param unitId 主键
     * @return 影响行数
     */
    int deleteById(String unitId);

}