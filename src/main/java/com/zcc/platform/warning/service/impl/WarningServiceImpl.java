package com.zcc.platform.warning.service.impl;

import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.StringUtil;
import com.zcc.commons.utils.TimeUtil;
import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import com.zcc.manager.tagmanager.service.TagObjectRelationService;
import com.zcc.platform.event.entity.EventInfoEntity;
import com.zcc.platform.event.service.EventInfoService;
import com.zcc.platform.person.entity.PersonEntity;
import com.zcc.platform.person.service.PersonService;
import com.zcc.platform.unit.entity.UnitEntity;
import com.zcc.platform.unit.service.UnitService;
import com.zcc.platform.warning.dao.WarningDao;
import com.zcc.platform.warning.entity.WarningEntity;
import com.zcc.platform.warning.service.WarningService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @author zcc
 */
@Service
public class WarningServiceImpl implements WarningService {

    private final WarningDao warningDao;

    private final TagObjectRelationService tagObjectRelationService;

    @Autowired
    private EventInfoService eventInfoService;
    @Autowired
    private PersonService personService;
    @Autowired
    protected UnitService unitService;

    public WarningServiceImpl(WarningDao warningDao, TagObjectRelationService tagObjectRelationService) {
        this.warningDao = warningDao;
        this.tagObjectRelationService = tagObjectRelationService;
    }

    @Override
    public String saveWarning(WarningEntity warningEntity) {

        if (StringUtil.isValidStr(warningEntity.getNoticeId())) {
            WarningEntity oldWarning = warningDao.findWarningById(warningEntity.getNoticeId());

            oldWarning.setNoticeId(warningEntity.getNoticeId());
            oldWarning.setNoticeName(warningEntity.getNoticeName());
            oldWarning.setNoticeContent(warningEntity.getNoticeContent());
            oldWarning.setNoticeDate(warningEntity.getNoticeDate());
            oldWarning.setNoticeLevel(warningEntity.getNoticeLevel());
            if (warningEntity.getNoticeType() == null) {
                oldWarning.setNoticeType(WarningEntity.UN_AUTO);
            } else {
                oldWarning.setNoticeType(warningEntity.getNoticeType());
            }


            //如果该预警是人员预警
            if (WarningEntity.WARNING_PERSON.equals(oldWarning.getNoticeObjectType())) {
                PersonEntity person = personService.findById(oldWarning.getNoticeObjectId());
                oldWarning.setNoticeAddr(person.getLiveAddr());
                oldWarning.setNoticeObjectName(person.getPersonName());
                setWarningTags(warningEntity, oldWarning);
            }
            //单位预警
            else if (WarningEntity.WARNING_UNIT.equals(oldWarning.getNoticeObjectType())) {
                UnitEntity unit = unitService.findById(oldWarning.getNoticeObjectId());
                oldWarning.setNoticeAddr(unit.getAddr());
                oldWarning.setNoticeObjectName(unit.getUnitName());
                setWarningTags(warningEntity, oldWarning);
            }
            //事件预警
            else if (WarningEntity.WARNING_EVENT.equals(oldWarning.getNoticeObjectType())) {
                EventInfoEntity event = eventInfoService.find(oldWarning.getNoticeObjectId());
                oldWarning.setNoticeAddr(event.getOccurredPlace());
                oldWarning.setNoticeLongi(event.getOccurredLongti());
                oldWarning.setNoticeLati(event.getOccurredLati());
                oldWarning.setNoticeObjectName(event.getEventName());
                setWarningTags(warningEntity, oldWarning);
            }
            warningDao.updateWarning(oldWarning);
        } else {
            warningEntity.setNoticeType(WarningEntity.UN_AUTO);
            warningDao.addWarning(warningEntity);
        }
        return warningEntity.getNoticeId();
    }

    private void setWarningTags(WarningEntity warningEntity, WarningEntity oldWarning) {
        JSONArray jsonArray = new JSONArray();
        List<TagBaseInfoEntity> tags = tagObjectRelationService.findTagByObjectId(warningEntity.getNoticeObjectId());
        for (TagBaseInfoEntity tag : tags) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.element("tagName", tag.getTagName());
            jsonObject.element("tagCssCode", tag.getTagCssCode());
            jsonArray.add(jsonObject);
        }
        oldWarning.setWarningTags(jsonArray.toString());
    }

    @Override
    public void delWarningById(String noticeId) {
        warningDao.delWarningById(noticeId);
    }

    @Override
    public void delWarningByType(String delWarningByType) {
        warningDao.delWarningByType(delWarningByType);
    }

    @Override
    public WarningEntity findWarningById(String noticeId) {
        return warningDao.findWarningById(noticeId);
    }

    @Override
    public List<WarningEntity> findWarning(String noticeName, String noticeObjectType, String begin, String end, String tags) {
        if (StringUtil.isValidStr(tags)) {
            return warningDao.findWarning(noticeName, noticeObjectType, begin, end, Arrays.asList(tags.split(",")));
        } else {
            return warningDao.findWarning(noticeName, noticeObjectType, begin, end, null);
        }

    }

    @Override
    public List<WarningEntity> findWarning(String noticeName, String noticeType, String begin, String end, String tags, Page page) {
        if (StringUtil.isValidStr(tags)) {
            return warningDao.findWarningWithPage(noticeName, noticeType, begin, end, Arrays.asList(tags.split(",")), page);
        } else {
            return warningDao.findWarningWithPage(noticeName, noticeType, begin, end, null, page);
        }
    }

    @Override
    public List<WarningEntity> findWarningByType(String noticeType) {
        return warningDao.findWarningByType(noticeType);
    }

    @Override
    public WarningEntity findWarningByNoticeObjectIdAndType(String noticeObjectId, String noticeObjectType) {
        return warningDao.findWarningByNoticeObjectIdAndType(noticeObjectId, noticeObjectType);
    }

    @Override
    public List<WarningEntity> findAll() {
        return warningDao.findAll();
    }

    @Override
    public List<WarningEntity> findAll(Page page) {
        return warningDao.findAllWithPage(page);
    }

    @Override
    public void autoEventWarning() {
        List<EventInfoEntity> eventInfoEntities = warningDao.autoWarningEvent(TimeUtil.getDayBefore(15));
        for (EventInfoEntity eventInfoEntity : eventInfoEntities) {
            //没有这条预警
            if (findWarningByNoticeObjectIdAndType(eventInfoEntity.getEventId(), WarningEntity.WARNING_EVENT) == null) {
                WarningEntity warningEntity = new WarningEntity();
                warningEntity.setNoticeName(eventInfoEntity.getEventName());
                warningEntity.setNoticeContent("【" + eventInfoEntity.getEventName() + "】自动预警");
                warningEntity.setNoticeType(WarningEntity.AUTO);
                warningEntity.setNoticeLevel(WarningEntity.LEVEL_THREE);
                warningEntity.setNoticeDate(new Date());
                warningEntity.setNoticeAddr(eventInfoEntity.getOccurredPlace());
                warningEntity.setNoticeLongi(eventInfoEntity.getOccurredLongti());
                warningEntity.setNoticeLati(eventInfoEntity.getOccurredLati());
                warningEntity.setNoticeObjectName(eventInfoEntity.getEventName());
                warningEntity.setNoticeObjectType(WarningEntity.WARNING_EVENT);
                warningEntity.setNoticeObjectId(eventInfoEntity.getEventId());
                //设置事件的标签为预警的标签
                JSONArray jsonArray = new JSONArray();
                List<TagBaseInfoEntity> tags = tagObjectRelationService.findTagByObjectId(eventInfoEntity.getEventId());
                //添加标签，保存预警
                warningAdd(warningEntity, jsonArray, tags);
            }

        }
    }

    @Override
    public void autoPersonWarning() {
        List<PersonEntity> personEntities = warningDao.autoWarningPerson(TimeUtil.getDayBefore(15));
        for (PersonEntity personEntity : personEntities) {
            //没有这条预警
            if (findWarningByNoticeObjectIdAndType(personEntity.getPersonId(), WarningEntity.WARNING_PERSON) == null) {
                WarningEntity warningEntity = new WarningEntity();
                warningEntity.setNoticeName(personEntity.getPersonName());
                warningEntity.setNoticeContent("【" + personEntity.getPersonName() + "】自动预警");
                warningEntity.setNoticeType(WarningEntity.AUTO);
                warningEntity.setNoticeLevel(WarningEntity.LEVEL_THREE);
                warningEntity.setNoticeDate(new Date());
                warningEntity.setNoticeAddr(personEntity.getLiveAddr());
                warningEntity.setNoticeObjectName(personEntity.getPersonName());
                warningEntity.setNoticeObjectType(WarningEntity.WARNING_PERSON);
                warningEntity.setNoticeObjectId(personEntity.getPersonId());
                //设置人员的标签为预警的标签
                JSONArray jsonArray = new JSONArray();
                List<TagBaseInfoEntity> tags = tagObjectRelationService.findTagByObjectId(personEntity.getPersonId());
                //添加标签，保存预警
                warningAdd(warningEntity, jsonArray, tags);

            }
        }

    }

    @Override
    public void autoUnitWarning() {
        List<UnitEntity> unitEntities = warningDao.autoWarningUnit(TimeUtil.getDayBefore(15));
        for (UnitEntity unitEntity : unitEntities) {
            if (findWarningByNoticeObjectIdAndType(unitEntity.getUnitId(), WarningEntity.WARNING_UNIT) == null) {
                WarningEntity warningEntity = new WarningEntity();
                warningEntity.setNoticeName(unitEntity.getUnitName());
                warningEntity.setNoticeContent("【" + unitEntity.getUnitName() + "】自动预警");
                warningEntity.setNoticeType(WarningEntity.AUTO);
                warningEntity.setNoticeLevel(WarningEntity.LEVEL_THREE);
                warningEntity.setNoticeDate(new Date());
                warningEntity.setNoticeAddr(unitEntity.getAddr());
                warningEntity.setNoticeObjectName(unitEntity.getUnitName());
                warningEntity.setNoticeObjectType(WarningEntity.WARNING_UNIT);
                warningEntity.setNoticeObjectId(unitEntity.getUnitId());
                //设置单位的标签为预警的标签
                JSONArray jsonArray = new JSONArray();
                List<TagBaseInfoEntity> tags = tagObjectRelationService.findTagByObjectId(unitEntity.getUnitId());
                //添加标签，保存预警
                warningAdd(warningEntity, jsonArray, tags);

            }
        }
    }

    private void warningAdd(WarningEntity warningEntity, JSONArray jsonArray, List<TagBaseInfoEntity> tags) {
        for (TagBaseInfoEntity tag : tags) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.element("tagName", tag.getTagName());
            jsonObject.element("tagCssCode", tag.getTagCssCode());
            jsonArray.add(jsonObject);
        }
        warningEntity.setWarningTags(jsonArray.toString());
        warningDao.addWarning(warningEntity);
    }


    @Override
    public void autoWarning() {
        delWarningByType(WarningEntity.AUTO);
        autoEventWarning();
        autoPersonWarning();
        autoUnitWarning();
    }
}
