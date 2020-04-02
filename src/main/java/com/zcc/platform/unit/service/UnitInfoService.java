package com.zcc.platform.unit.service;

import com.zcc.platform.unit.entity.UnitEntity;

import java.util.List;

/**
 * (UnitInfo)表服务接口
 *
 * @author makejava
 * @since 2020-04-02 11:31:07
 */
public interface UnitInfoService {

    /**
     * 通过ID查询单条数据
     *
     * @param unitId 主键
     * @return 实例对象
     */
    UnitEntity queryById(String unitId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<UnitEntity> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param unitEntity 实例对象
     * @return 实例对象
     */
    UnitEntity insert(UnitEntity unitEntity);

    /**
     * 修改数据
     *
     * @param unitEntity 实例对象
     * @return 实例对象
     */
    UnitEntity update(UnitEntity unitEntity);

    /**
     * 通过主键删除数据
     *
     * @param unitId 主键
     * @return 是否成功
     */
    boolean deleteById(String unitId);

}