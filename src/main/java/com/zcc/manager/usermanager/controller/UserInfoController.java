package com.zcc.manager.usermanager.controller;

import com.zcc.log.annotation.Log;
import com.zcc.manager.usermanager.entity.UserInfoEntity;
import com.zcc.manager.usermanager.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zcc
 */
@Controller("userInfoController")
@RequestMapping("/userInfo")
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;


    @Log(name = "添加用户")
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(){

        UserInfoEntity userInfoEntity=new UserInfoEntity();
        userInfoEntity.setUserName("zcc");
        userInfoEntity.setPassword("1");
        userInfoEntity.setPhoneNumber("1312231");
        userInfoEntity.setType(UserInfoEntity.USER);
        userInfoService.add(userInfoEntity);
        userInfoService.del("zcc");
        return "/WEB-INF/success";
    }
}
