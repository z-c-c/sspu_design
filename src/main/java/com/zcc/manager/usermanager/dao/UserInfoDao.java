package com.zcc.manager.usermanager.dao;

import com.zcc.manager.usermanager.entity.UserInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @author zcc
 */
@Repository
public interface UserInfoDao {
    /**
     * 添加用户
     *
     * @param userInfoEntity 用户信息
     * @return id
     */
    void add(UserInfoEntity userInfoEntity);

    /**
     * 根据用户名查找
     *
     * @param userName userName
     * @return UserInfoEntity
     */
    UserInfoEntity findByUserName(@Param("userName") String userName);


    /**
     * 修改用户
     *
     * @param userInfoEntity userInfoEntity
     */
    void update(UserInfoEntity userInfoEntity);

    /**
     * 查找
     *
     * @param userName userName
     * @param type     type
     * @return UserInfoEntity
     */
    UserInfoEntity findByUserNameAndType(@Param("userName") String userName, @Param("type") String type);
}
