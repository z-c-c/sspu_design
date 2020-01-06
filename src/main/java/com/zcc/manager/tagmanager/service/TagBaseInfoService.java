package com.zcc.manager.tagmanager.service;

import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;

import java.util.List;

/**
 * @author zcc
 */
public interface TagBaseInfoService {
    /**
     * 保存标签
     * @param tagBaseInfoEntity tagBaseInfoEntity
     * @return id
     */
    String save(TagBaseInfoEntity tagBaseInfoEntity);

    /**
     * 添加标签
     * @param tagBaseInfoEntityList list
     */
    void save(List<TagBaseInfoEntity> tagBaseInfoEntityList);

    /**
     * 删除标签
     * @param tagId
     */
    void  del(String tagId);

    /**
     * 查找标签
     * @param tagName 标签名
     * @return list
     */
    List<TagBaseInfoEntity> find(String tagName);

    /**
     * 查找标签
     * @param tagBaseInfoEntity
     * @return
     */
    List<TagBaseInfoEntity> find(TagBaseInfoEntity tagBaseInfoEntity);

    /**
     * 根据标签标注对象查标签
     * @param objectId
     * @return
     */
    List<TagBaseInfoEntity> findTagByObject(String objectId);

    /**
     * 查询所有
     * @return
     */
    List<TagBaseInfoService> findAll();

}
