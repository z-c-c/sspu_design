package com.zcc.manager.tagmanager.service.impl;

import com.zcc.commons.utils.StringUtil;
import com.zcc.manager.tagmanager.dao.TagObjectRelationDao;
import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import com.zcc.manager.tagmanager.entity.TagObjectRelationEntity;
import com.zcc.manager.tagmanager.service.TagObjectRelationService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zcc
 */
@Service("tagObjectRelationService")
public class TagObjectRelationServiceImpl implements TagObjectRelationService {

    private final TagObjectRelationDao tagObjectRelationDao;

    public TagObjectRelationServiceImpl(TagObjectRelationDao tagObjectRelationDao) {
        this.tagObjectRelationDao = tagObjectRelationDao;
    }

    /**
     * 获取对象拥有的标签
     *
     * @param objectId objectId
     * @return list
     */
    @Override
    public List<TagBaseInfoEntity> findTagByObjectId(String objectId) {
        return tagObjectRelationDao.findTagByObjectId(objectId);
    }

    /**
     * 为对象添加标签
     *
     * @param tagObjectRelationEntity tagObjectRelationEntity
     */
    @Override
    public void addTagForObject(TagObjectRelationEntity tagObjectRelationEntity) {
        TagBaseInfoEntity tagByObjectIdAndTagId = tagObjectRelationDao.findTagByObjectIdAndTagId(tagObjectRelationEntity.getObjectId(), tagObjectRelationEntity.getTagId());
        if (tagByObjectIdAndTagId == null) {
            tagObjectRelationDao.addTagForObject(tagObjectRelationEntity);
        }
    }

    /**
     * 删除对象的标签
     *
     * @param tagId    tagId
     * @param objectId objectId
     */
    @Override
    public void delTagForObject(String tagId, String objectId) {
        tagObjectRelationDao.delTagForObject(tagId, objectId);
    }

    /**
     * 删除对象的所有标签
     *
     * @param objectId
     */
    @Override
    public void delTagForObject(String objectId) {
        if (StringUtil.isValidStr(objectId)) {
            tagObjectRelationDao.delAllTagForObject(objectId);
        }
    }
}
