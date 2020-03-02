package com.zcc.manager.tagmanager.service;

import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import com.zcc.manager.tagmanager.entity.TagObjectRelationEntity;

import java.util.List;

/**
 * @author zcc
 */
public interface TagObjectRelationService {
    /**
     * 获取对象拥有的标签
     *
     * @param objectId objectId
     * @return list
     */
    List<TagBaseInfoEntity> findTagByObjectId(String objectId);

    /**
     * 为对象添加标签
     *
     * @param tagObjectRelationEntity tagObjectRelationEntity
     */
    void addTagForObject(TagObjectRelationEntity tagObjectRelationEntity);

    /**
     * 删除对象的标签
     *
     * @param tagId    tagId
     * @param objectId objectId
     */
    void delTagForObject(String tagId, String objectId);

    /**
     * 删除对象的所有标签
     *
     * @param objectId
     */
    void delTagForObject(String objectId);
}
