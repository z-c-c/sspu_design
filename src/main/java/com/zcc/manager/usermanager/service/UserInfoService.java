package com.zcc.manager.usermanager.service;

import com.zcc.manager.usermanager.entity.UserInfoEntity;

/**
 * @author zcc
 */
public interface UserInfoService {
    /**
     * 添加用户
     *
     * @param userInfoEntity userInfo
     * @return id
     */
    String add(UserInfoEntity userInfoEntity);

    /**
     * 根据用户名查找
     *
     * @param userName userName
     * @return
     */
    UserInfoEntity findByUserName(String userName);

    /**
     * 注销用户
     *
     * @param userName userName
     */
    void del(String userName);

    /**
     * 修改用户
     *
     * @param userInfoEntity
     */
    void update(UserInfoEntity userInfoEntity);

    /**
     * 查找
     *
     * @param name
     * @param type
     * @return
     */
    UserInfoEntity findByNameAndType(String name, String type);

}
