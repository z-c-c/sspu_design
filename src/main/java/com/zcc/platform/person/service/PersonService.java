package com.zcc.platform.person.service;

import com.zcc.commons.utils.Page;
import com.zcc.platform.person.entity.PersonEntity;

import java.util.List;

/**
 * @author zcc
 */
public interface PersonService {
    /**
     * 保存人员
     *
     * @param personEntity personEntity
     * @param tags         tags
     * @return Id
     */
    String save(PersonEntity personEntity, String tags);

    /**
     * 保存人员
     *
     * @param personEntity  personEntity
     * @return Id
     */
    String save(PersonEntity personEntity);

    /**
     * 删除人员
     *
     * @param personId personId
     */
    void del(String personId);

    /**
     * 查找人员
     *
     * @param personId personId
     * @return PersonEntity
     */
    PersonEntity findById(String personId);

    /**
     * 查找全部人员
     *
     * @return list
     */
    List<PersonEntity> findAll();

    /**
     * 查找人员
     *
     * @param gender gender
     * @return list
     */
    List<PersonEntity> findByGender(String gender);

    /**
     * 模糊查找
     *
     * @param param param
     * @return list
     */
    List<PersonEntity> find(String param);

    /**
     * 模糊查找+标签查找
     *
     * @param param param
     * @param tags tags
     * @return list
     */
    List<PersonEntity> find(String param, String tags);

    /**
     * 模糊查找+分页
     *
     * @param param param
     * @param page page
     * @return list
     */
    List<PersonEntity> find(String param, Page page);

    /**
     * 模糊查找+标签+分页
     *
     * @param param param
     * @param page page
     * @param tags tags
     * @return list
     */
    List<PersonEntity> find(String param, Page page, String tags);

    /**
     * 人物数据聚合
     *
     * @param personId personId
     * @return list
     */
    List<PersonEntity> dateTogether(String personId);

    /**
     * 数据聚合
     *
     * @param personId personId
     * @param page     page
     * @return list
     */
    List<PersonEntity> dateTogether(String personId, Page page);

    /**
     * 数据聚合
     *
     * @return list
     */
    List<PersonEntity> dateTogetherAll();

    /**
     * 数据聚合
     *
     * @param page page
     * @return list
     */
    List<PersonEntity> dateTogetherAll(Page page);
}
