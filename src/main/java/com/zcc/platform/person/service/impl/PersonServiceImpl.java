package com.zcc.platform.person.service.impl;

import com.zcc.commons.utils.ConstUtil;
import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.StringUtil;
import com.zcc.manager.tagmanager.entity.TagObjectRelationEntity;
import com.zcc.manager.tagmanager.service.TagObjectRelationService;
import com.zcc.platform.person.dao.PersonDao;
import com.zcc.platform.person.entity.PersonEntity;
import com.zcc.platform.person.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

/**
 * @author zcc
 */
@Service
public class PersonServiceImpl implements PersonService {

    private final PersonDao personDao;

    private final TagObjectRelationService tagObjectRelationService;

    @Autowired
    public PersonServiceImpl(PersonDao personDao, TagObjectRelationService tagObjectRelationService) {
        this.personDao = personDao;
        this.tagObjectRelationService = tagObjectRelationService;
    }

    @Override
    public String save(PersonEntity personEntity, String tags) {
        if (StringUtil.isValidStr(personEntity.getPersonId())) {
            personDao.updatePerson(personEntity);
        } else {
            personDao.addPerson(personEntity);
        }
        //人员标签管理
        if (StringUtil.isValidStr(tags)) {
            String[] split = tags.split(",");
            tagObjectRelationService.delTagForObject(personEntity.getPersonId());
            for (String tag : split) {
                TagObjectRelationEntity tagObjectRelationEntity = new TagObjectRelationEntity();
                tagObjectRelationEntity.setIsDelete("0");
                tagObjectRelationEntity.setObjectId(personEntity.getPersonId());
                tagObjectRelationEntity.setObjectType(ConstUtil.PERSON_TAG);
                tagObjectRelationEntity.setTagId(tag);
                tagObjectRelationService.addTagForObject(tagObjectRelationEntity);
            }
        } else {
            tagObjectRelationService.delTagForObject(personEntity.getPersonId());
        }
        return personEntity.getPersonId();
    }

    @Override
    public String save(PersonEntity personEntity) {
        if (StringUtil.isValidStr(personEntity.getPersonId())) {
            personDao.updatePerson(personEntity);
        } else {
            personDao.addPerson(personEntity);
        }
        return personEntity.getPersonId();
    }

    @Override
    public void del(String personId) {
        personDao.delPerson(personId);
    }

    @Override
    public PersonEntity findById(String personId) {
        return personDao.findPersonById(personId);
    }

    @Override
    public List<PersonEntity> findByGender(String gender) {
        return personDao.findByGender(gender);
    }

    @Override
    public List<PersonEntity> find(String param) {
        return personDao.findPerson(param);
    }

    @Override
    public List<PersonEntity> find(String param, String tags) {
        return personDao.findPersonWithTag(param, Arrays.asList(tags.split(",")));
    }

    @Override
    public List<PersonEntity> find(String param, Page page) {
        return personDao.findPersonWithPage(param, page);
    }

    @Override
    public List<PersonEntity> find(String param, Page page, String tags) {
        return personDao.findPersonWithPageAndTag(param, page, Arrays.asList(tags.split(",")));
    }

    @Override
    public List<PersonEntity> dateTogether(String personId) {
        return personDao.dateTogether(personId);
    }

    @Override
    public List<PersonEntity> dateTogether(String personId, Page page) {
        return personDao.dateTogetherWithPage(personId, page);
    }

    @Override
    public List<PersonEntity> dateTogetherAll() {
        return personDao.dateTogetherAll();
    }

    @Override
    public List<PersonEntity> dateTogetherAll(Page page) {
        return personDao.dateTogetherAllWithPage(page);
    }
}
