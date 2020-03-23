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
     * @param personEntity
     * @return
     */
    void addPerson(PersonEntity personEntity);

    /**
     * 删除人员
     *
     * @param personId
     */
    void delPerson(String personId);

    /**
     * 修改人员
     *
     * @param personEntity
     */
    void updatePerson(PersonEntity personEntity);

    /**
     * 查找人员
     *
     * @param personId
     * @return
     */
    PersonEntity findPersonById(String personId);

    /**
     * 模糊查找
     *
     * @param param
     * @return
     */
    List<PersonEntity> findPerson(String param);

    /**
     * 模糊查找+标签查找
     *
     * @param param
     * @param tags
     * @return
     */
    List<PersonEntity> findPersonWithTag(@Param("param") String param, @Param("tags") List<String> tags);

    /**
     * 模糊查找+分页
     *
     * @param param
     * @param page
     * @return
     */
    List<PersonEntity> findPersonWithPage(@Param("param") String param, @Param("page") Page page);

    /**
     * 模糊查找+标签+分页
     *
     * @param param
     * @param page
     * @param tags
     * @return
     */
    List<PersonEntity> findPersonWithPageAndTag(@Param("param") String param, @Param("page") Page page, @Param("tags") List<String> tags);

}
