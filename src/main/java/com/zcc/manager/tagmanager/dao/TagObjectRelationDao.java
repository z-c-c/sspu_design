package com.zcc.manager.tagmanager.dao;

import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import com.zcc.manager.tagmanager.entity.TagObjectRelationEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import javax.swing.*;
import java.util.List;

/**
 * @author zcc
 */
@Repository("tagObjectRelationDao")
public interface TagObjectRelationDao {

    /**
     * 获取对象拥有的标签
     *
     * @param objectId objectId
     * @return list
     */
    List<TagBaseInfoEntity> findTagByObjectId(String objectId);

    /**
     * 给对象添加标签
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
    void delTagForObject(@Param("tagId") String tagId, @Param("objectId") String objectId);

    /**
     * 删除对象的所有标签
     *
     * @param objectId
     */
    void delAllTagForObject(String objectId);

    /**
     * 查找对象的特定标签
     *
     * @param objectId objectId
     * @param tagId    tagId
     * @return TagBaseInfoEntity
     */
    TagBaseInfoEntity findTagByObjectIdAndTagId(@Param("objectId") String objectId, @Param("tagId") String tagId);
}
