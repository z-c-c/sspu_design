package com.zcc.platform.person.dao;

import com.zcc.commons.utils.Page;
import com.zcc.platform.person.entity.PersonEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author zcc
 */
@Repository
public interface PersonDao {
    /**
     * 添加人员
     *
     * @param personEntity personEntity
     */
    void addPerson(PersonEntity personEntity);

    /**
     * 删除人员
     *
     * @param personId personId
     */
    void delPerson(String personId);

    /**
     * 修改人员
     *
     * @param personEntity personEntity
     */
    void updatePerson(PersonEntity personEntity);

    /**
     * 查找人员
     *
     * @param personId personId
     * @return PersonEntity
     */
    PersonEntity findPersonById(String personId);

    /**
     * 查好啊全部人员
     *
     * @return List
     */
    List<PersonEntity> findAll();

    /**
     * 查找人员
     *
     * @param gender gender
     * @return List
     */
    List<PersonEntity> findByGender(String gender);

    /**
     * 模糊查找 ：姓名/曾用名/性别/手机号/身份证号/籍贯/居住地
     *
     * @param param param
     * @return list
     */
    List<PersonEntity> findPerson(@Param("param") String param);

    /**
     * 模糊查找+标签查找
     *
     * @param param param
     * @param tags  tags
     * @return list
     */
    List<PersonEntity> findPersonWithTag(@Param("param") String param, @Param("tags") List<String> tags);

    /**
     * 模糊查找+分页
     *
     * @param param param
     * @param page  page
     * @return list
     */
    List<PersonEntity> findPersonWithPage(@Param("param") String param, @Param("page") Page page);

    /**
     * 模糊查找+标签+分页
     *
     * @param param param
     * @param page page
     * @param tags tags
     * @return list
     */
    List<PersonEntity> findPersonWithPageAndTag(@Param("param") String param, @Param("page") Page page, @Param("tags") List<String> tags);

    /**
     * 数据聚合
     *
     * @param personId personId
     * @return list
     */
    List<PersonEntity> dateTogether(String personId);

    /**
     * 数据聚合
     *
     * @param personId personId
     * @param page page
     * @return list
     */
    List<PersonEntity> dateTogetherWithPage(@Param("personId") String personId, @Param("page") Page page);

    /**
     * 数据聚合
     * @return List
     */
    List<PersonEntity> dateTogetherAll();

    /**
     * 数据聚合
     *
     * @param page page
     * @return list
     */
    List<PersonEntity> dateTogetherAllWithPage(Page page);

}
