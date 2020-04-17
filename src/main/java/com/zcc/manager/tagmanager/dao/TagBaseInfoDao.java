package com.zcc.manager.tagmanager.dao;

import com.zcc.commons.utils.Page;
import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author zcc
 */
@Repository("tagBaseInfoDao")
public interface TagBaseInfoDao {

    /**
     * 添加标签
     *
     * @param tagBaseInfoEntity tagBaseInfoEntity
     */
    void add(TagBaseInfoEntity tagBaseInfoEntity);


    /**
     * 删除标签
     *
     * @param tagId
     */
    void del(String tagId);

    /**
     * 修改标签
     *
     * @param tagBaseInfoEntity tagBaseInfoEntity
     */
    void update(TagBaseInfoEntity tagBaseInfoEntity);

    /**
     * 查找标签
     *
     * @param tagName 标签名
     * @return list
     */
    List<TagBaseInfoEntity> findByName(String tagName);

    /**
     * 查找标签
     *
     * @param tagId id
     * @return TagBaseInfoEntity
     */
    TagBaseInfoEntity findById(String tagId);

    /**
     * 查找标签
     *
     * @param tagBaseInfoEntity tagBaseInfoEntity
     * @return list
     */
    List<TagBaseInfoEntity> find(TagBaseInfoEntity tagBaseInfoEntity);

    /**
     * 分页查找标签
     *
     * @param tagBaseInfoEntity tagBaseInfoEntity
     * @param page              page
     * @return list
     */
    List<TagBaseInfoEntity> findWithPages(@Param("TagBaseInfoEntity") TagBaseInfoEntity tagBaseInfoEntity, @Param("Page") Page page);

    /**
     * 根据标注对象查标签
     *
     * @param objectId objectId
     * @return list
     */
    List<TagBaseInfoEntity> findByObjectId(String objectId);

    /**
     * 查询所有
     *
     * @return
     */
    List<TagBaseInfoEntity> findAll();

}
