package com.zcc.manager.tagmanager.service.impl;

import com.zcc.manager.tagmanager.dao.TagBaseInfoDao;
import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import com.zcc.manager.tagmanager.service.TagBaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zcc
 */
@Service("tagBaseInfoService")
public class TagBaseInfoServiceImpl implements TagBaseInfoService {


    @Autowired
    private TagBaseInfoDao tagDao;

    /**
     * 保存标签
     *
     * @param tagBaseInfoEntity tagBaseInfoEntity
     * @return id
     */
    @Override
    public String save(TagBaseInfoEntity tagBaseInfoEntity) {
        if (tagBaseInfoEntity.getTagId() != null) {
            tagDao.update(tagBaseInfoEntity);
        } else {
            tagDao.add(tagBaseInfoEntity);
        }
        return tagBaseInfoEntity.getTagId();
    }

    /**
     * 添加标签
     *
     * @param tagBaseInfoEntityList list
     */
    @Override
    public void save(List<TagBaseInfoEntity> tagBaseInfoEntityList) {
        for (TagBaseInfoEntity tagBaseInfoEntity : tagBaseInfoEntityList) {
            tagDao.add(tagBaseInfoEntity);
        }
    }

    /**
     * 删除标签
     *
     * @param tagId
     */
    @Override
    public void del(String tagId) {
        TagBaseInfoEntity byId = tagDao.findById(tagId);
        if (byId != null) {
            tagDao.del(tagId);
        }
    }

    /**
     * 查找标签
     *
     * @param tagName 标签名
     * @return list
     */
    @Override
    public List<TagBaseInfoEntity> find(String tagName) {
        List<TagBaseInfoEntity> tagBaseInfoEntities = tagDao.findByName(tagName);
        return tagBaseInfoEntities;
    }

    /**
     * 查找标签
     *
     * @param tagBaseInfoEntity
     * @return
     */
    @Override
    public List<TagBaseInfoEntity> find(TagBaseInfoEntity tagBaseInfoEntity) {
        List<TagBaseInfoEntity> tagBaseInfoEntities = tagDao.find(tagBaseInfoEntity);
        return tagBaseInfoEntities;
    }

    /**
     * 根据标签标注对象查标签
     *
     * @param objectType
     * @return
     */
    @Override
    public List<TagBaseInfoEntity> findTagByObject(String objectId) {
        return tagDao.findByObjectId(objectId);
    }

    /**
     * 查询所有
     *
     * @return
     */
    @Override
    public List<TagBaseInfoService> findAll() {
        return tagDao.findAll();
    }
}
