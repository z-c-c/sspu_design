package com.zcc.platform.warning.service.impl;

import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.StringUtil;
import com.zcc.commons.utils.TimeUtil;
import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import com.zcc.manager.tagmanager.service.TagObjectRelationService;
import com.zcc.platform.event.entity.EventInfoEntity;
import com.zcc.platform.person.entity.PersonEntity;
import com.zcc.platform.unit.entity.UnitEntity;
import com.zcc.platform.warning.dao.WarningDao;
import com.zcc.platform.warning.entity.WarningEntity;
import com.zcc.platform.warning.service.WarningService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;

import java.text.Format;
import java.text.SimpleDateFormat;
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

    public WarningServiceImpl(WarningDao warningDao, TagObjectRelationService tagObjectRelationService) {
        this.warningDao = warningDao;
        this.tagObjectRelationService = tagObjectRelationService;
    }

    @Override
    public String saveWarning(WarningEntity warningEntity) {
        //设置预警类型为手动
        warningEntity.setNoticeType(WarningEntity.UN_AUTO);
        if (StringUtil.isValidStr(warningEntity.getNoticeId())) {
            warningDao.updateWarning(warningEntity);
        } else {
            warningDao.addWarning(warningEntity);
        }
        return warningEntity.getNoticeId();
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
    public List<WarningEntity> findWarning(String noticeName, String noticeType, String begin, String end, String tags) {
        return warningDao.findWarning(noticeName, noticeType, begin, end, Arrays.asList(tags.split(",")));
    }

    @Override
    public List<WarningEntity> findWarning(String noticeName, String noticeType, String begin, String end, String tags, Page page) {
        return warningDao.findWarningWithPage(noticeName, noticeType, begin, end, Arrays.asList(tags.split(",")), page);
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
                warningEntity.setNoticeObjectType(WarningEntity.WARNING_UNIT);
                warningEntity.setNoticeObjectId(eventInfoEntity.getEventId());
                //设置单位的标签为预警的标签
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
