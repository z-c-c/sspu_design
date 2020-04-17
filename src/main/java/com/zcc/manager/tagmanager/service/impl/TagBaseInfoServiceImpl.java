package com.zcc.manager.tagmanager.service.impl;

import com.zcc.commons.utils.Page;
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
        if (tagBaseInfoEntity.getTagId() == null || "".equals(tagBaseInfoEntity.getTagId())) {
            tagDao.add(tagBaseInfoEntity);
        } else {
            tagDao.update(tagBaseInfoEntity);
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
     * @param tagId
     * @return
     */
    @Override
    public TagBaseInfoEntity findById(String tagId) {
        return tagDao.findById(tagId);
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
     * 分页查找标签
     *
     * @param tagBaseInfoEntity
     * @param page
     * @return
     */
    @Override
    public List<TagBaseInfoEntity> find(TagBaseInfoEntity tagBaseInfoEntity, Page page) {
        if (page != null) {
            return tagDao.findWithPages(tagBaseInfoEntity, page);
        }
        return null;
    }

    /**
     * 根据标签标注对象查标签
     *
     * @param objectId
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
    public List<TagBaseInfoEntity> findAll() {
        return tagDao.findAll();
    }
}
