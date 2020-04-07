package com.zcc.platform.unit.service.impl;

import com.zcc.commons.utils.ConstUtil;
import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.StringUtil;
import com.zcc.manager.tagmanager.entity.TagObjectRelationEntity;
import com.zcc.manager.tagmanager.service.TagObjectRelationService;
import com.zcc.platform.unit.dao.UnitDao;
import com.zcc.platform.unit.entity.UnitEntity;
import com.zcc.platform.unit.service.UnitService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * @author zcc
 */
@Service
public class UnitServiceImpl implements UnitService {

    private final UnitDao unitDao;
    private final TagObjectRelationService tagObjectRelationService;

    public UnitServiceImpl(UnitDao unitDao, TagObjectRelationService tagObjectRelationService) {
        this.unitDao = unitDao;
        this.tagObjectRelationService = tagObjectRelationService;
    }

    @Override
    public String save(UnitEntity unitEntity, String tags) {
        if (StringUtil.isValidStr(unitEntity.getUnitId())) {
            unitDao.updateUnit(unitEntity);
        } else {
            unitDao.addUnit(unitEntity);
        }
        //单位标签管理
        if (StringUtil.isValidStr(tags)) {
            tagObjectRelationService.delTagForObject(unitEntity.getUnitId());
            String[] tagIds = tags.split(",");
            for (String tagId : tagIds) {
                TagObjectRelationEntity tagObjectRelationEntity = new TagObjectRelationEntity();
                tagObjectRelationEntity.setIsDelete("0");
                tagObjectRelationEntity.setObjectId(unitEntity.getUnitId());
                tagObjectRelationEntity.setObjectType(ConstUtil.UNIT_TAG);
                tagObjectRelationEntity.setTagId(tagId);
                tagObjectRelationService.addTagForObject(tagObjectRelationEntity);
            }
        } else {
            tagObjectRelationService.delTagForObject(unitEntity.getUnitId());
        }
        return unitEntity.getUnitId();
    }

    @Override
    public String save(UnitEntity unitEntity) {
        if (StringUtil.isValidStr(unitEntity.getUnitId())) {
            unitDao.updateUnit(unitEntity);
        } else {
            unitDao.addUnit(unitEntity);
        }
        return unitEntity.getUnitId();
    }

    @Override
    public void del(String unitId) {
        unitDao.delUnit(unitId);
    }

    @Override
    public UnitEntity findById(String unitId) {
        return unitDao.findUnitById(unitId);
    }

    @Override
    public List<UnitEntity> findByStatus(String status) {
        return unitDao.findUnitByStatus(status);
    }

    @Override
    public List<UnitEntity> find(String param, String status) {
        return unitDao.findUnit(param, status);
    }

    @Override
    public List<UnitEntity> find(String param, String tags, String status) {
        return unitDao.findUnitWithTag(param, Arrays.asList(tags.split(",")), status);
    }

    @Override
    public List<UnitEntity> find(String param, Page page, String status) {
        return unitDao.findUnitWithPage(param, page, status);
    }

    @Override
    public List<UnitEntity> find(String param, Page page, String tags, String status) {
        return unitDao.findUnitWithPageAndTag(param, page, Arrays.asList(tags.split(",")), status);
    }

    @Override
    public List<UnitEntity> dataTogether(String unitId) {
        return unitDao.dataTogether(unitId);
    }

    @Override
    public List<UnitEntity> dataTogether(String unitId, Page page) {
        return unitDao.dataTogetherWithPage(unitId, page);
    }

    @Override
    public List<UnitEntity> dataTogether() {
        return unitDao.dataTogetherAll();
    }

    @Override
    public List<UnitEntity> dataTogether(Page page) {
        return unitDao.dataTogetherAllWithPage(page);
    }
}
