package com.zcc.platform.unit.service.impl;

import com.zcc.platform.unit.entity.UnitEntity;
import com.zcc.platform.unit.dao.UnitInfoDao;
import com.zcc.platform.unit.service.UnitInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (UnitInfo)表服务实现类
 *
 * @author makejava
 * @since 2020-04-02 11:31:09
 */
@Service("unitInfoService")
public class UnitInfoServiceImpl implements UnitInfoService {
    @Resource
    private UnitInfoDao unitInfoDao;

    /**
     * 通过ID查询单条数据
     *
     * @param unitId 主键
     * @return 实例对象
     */
    @Override
    public UnitEntity queryById(String unitId) {
        return this.unitInfoDao.queryById(unitId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<UnitEntity> queryAllByLimit(int offset, int limit) {
        return this.unitInfoDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param unitEntity 实例对象
     * @return 实例对象
     */
    @Override
    public UnitEntity insert(UnitEntity unitEntity) {
        this.unitInfoDao.insert(unitEntity);
        return unitEntity;
    }

    /**
     * 修改数据
     *
     * @param unitEntity 实例对象
     * @return 实例对象
     */
    @Override
    public UnitEntity update(UnitEntity unitEntity) {
        this.unitInfoDao.update(unitEntity);
        return this.queryById(unitEntity.getUnitId());
    }

    /**
     * 通过主键删除数据
     *
     * @param unitId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String unitId) {
        return this.unitInfoDao.deleteById(unitId) > 0;
    }
}