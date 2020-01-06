package com.zcc.manager.usermanager.service.impl;

import com.zcc.manager.usermanager.dao.UserInfoDao;
import com.zcc.manager.usermanager.entity.UserInfoEntity;
import com.zcc.manager.usermanager.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zcc
 */
@Service("userInfoServiceImpl")
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoDao userInfoDao;

    @Override
    public String add(UserInfoEntity userInfoEntity) {
        UserInfoEntity byUserName = userInfoDao.findByUserName(userInfoEntity.getUserName());
        if(byUserName==null){
            userInfoDao.add(userInfoEntity);
            String userName = userInfoEntity.getUserName();
            return userName;
        }
        return "";
    }

    @Override
    public UserInfoEntity findByUserName(String userName) {
        return userInfoDao.findByUserName(userName);
    }

    @Override
    public void del(String userName) {
        UserInfoEntity byUserName = userInfoDao.findByUserName(userName);
        if(byUserName!=null){
            byUserName.setIsDelete("1");
            userInfoDao.update(byUserName);
        }
    }

    /**
     * 修改用户
     *
     * @param userInfoEntity
     */
    @Override
    public void update(UserInfoEntity userInfoEntity) {
        UserInfoEntity byUserName = userInfoDao.findByUserName(userInfoEntity.getUserName());
        if(byUserName!=null){
            userInfoDao.update(userInfoEntity);
        }
    }

    @Override
    public UserInfoEntity findByNameAndType(String name, String type) {

        return userInfoDao.findByUserNameAndType(name,type);
    }
}
