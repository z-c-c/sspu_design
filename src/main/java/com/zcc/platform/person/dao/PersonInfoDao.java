package com.zcc.platform.person.dao;

import com.zcc.commons.utils.Page;
import com.zcc.platform.person.entity.PersonInfoEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zcc
 */
public interface PersonInfoDao {
    /**
     * 添加人员
     *
     * @param personInfoEntity
     * @return
     */
    String addPerson(PersonInfoEntity personInfoEntity);

    /**
     * 删除人员
     *
     * @param personId
     */
    void delPerson(String personId);

    /**
     * 修改人员
     *
     * @param personInfoEntity
     */
    void updatePerson(PersonInfoEntity personInfoEntity);

    /**
     * 查找人员
     *
     * @param personId
     * @return
     */
    PersonInfoEntity findPersonById(String personId);

    /**
     * 模糊查找
     *
     * @param param
     * @return
     */
    List<PersonInfoEntity> findPerson(String param);

    /**
     * 模糊查找+标签查找
     *
     * @param param
     * @param tags
     * @return
     */
    List<PersonInfoEntity> findPersonWithTag(@Param("param") String param, @Param("tags") List<String> tags);

    /**
     * 模糊查找+分页
     *
     * @param param
     * @param page
     * @return
     */
    List<PersonInfoEntity> findPersonWithPage(@Param("param") String param, @Param("page") Page page);

    /**
     * 模糊查找+标签+分页
     *
     * @param param
     * @param page
     * @param tags
     * @return
     */
    List<PersonInfoEntity> findPersonWithPageAndTag(@Param("param") String param, @Param("page") Page page, @Param("tags") List<String> tags);

}
