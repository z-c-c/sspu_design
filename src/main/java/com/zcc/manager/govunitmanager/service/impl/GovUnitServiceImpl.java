package com.zcc.manager.govunitmanager.service.impl;

import com.zcc.commons.utils.Page;
import com.zcc.manager.govunitmanager.dao.GovUnitDao;
import com.zcc.manager.govunitmanager.entity.GovUnitEntity;
import com.zcc.manager.govunitmanager.entity.GovUnitRelation;
import com.zcc.manager.govunitmanager.service.GovUnitService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zcc
 */
@Service
public class GovUnitServiceImpl implements GovUnitService {

    private final GovUnitDao dao;

    public GovUnitServiceImpl(GovUnitDao dao) {
        this.dao = dao;
    }

    @Override
    public Integer add(GovUnitEntity govUnitEntity) {
        return dao.add(govUnitEntity);
    }

    @Override
    public void delete(int id) {
        dao.delete(id);
    }

    @Override
    public void update(GovUnitEntity govUnitEntity) {
        dao.update(govUnitEntity);
    }

    @Override
    public List<GovUnitEntity> findAll() {
        return dao.findAll();
    }

    @Override
    public List<GovUnitEntity> findAllWithPage(Page page) {
        return dao.findAllWithPage(page);
    }

    @Override
    public void addGovRelation(List<GovUnitRelation> govUnitRelations) {
        for (GovUnitRelation govUnitRelation : govUnitRelations) {
            dao.delGovRelation(govUnitRelation.getEventId());
        }
        for (GovUnitRelation govUnitRelation : govUnitRelations) {
            govUnitRelation.setIsDelete("0");
            dao.addGovRelation(govUnitRelation);
        }
    }

    @Override
    public void delGovRelation(String eventId) {
        dao.delGovRelation(eventId);
    }

    @Override
    public GovUnitEntity findGovRelationUnit(String eventId, String type) {
        return dao.findGovRelationUnit(eventId, type);
    }
}
