package com.zcc.commons.controller;

import com.zcc.commons.utils.ConstUtil;
import com.zcc.log.annotation.Log;
import com.zcc.manager.usermanager.entity.UserInfoEntity;
import com.zcc.manager.usermanager.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zcc
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserInfoService userInfoService;

    @Log(name = "用户登陆")
    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response, String userName, String passWord, String type, String flag) {

        Map<String, Object> map = new HashMap<>(4);

        HttpSession session = request.getSession();
        UserInfoEntity userInfoEntity = userInfoService.findByNameAndType(userName,type);
        if (userInfoEntity != null) {
            //密码错误
            if (!passWord.equals(userInfoEntity.getPassword())) {
                map.put("result", "passError");
            } else {
                userInfoEntity.setPassword(null);
                userInfoEntity.setPhoneNumber(null);
                session.setAttribute(ConstUtil.CURRENT_PERSON, userInfoEntity);
                if (ConstUtil.NO_FLAG.equals(flag)) {
                    map.put("url", "wwpt/shell.jsp");
                } else {
                    map.put("url", "/manager/shell.jsp");
                }
                map.put("result", "success");
                System.out.println("用户" + userInfoEntity.getUserName() + " 登陆系统");
            }
        } else {
            map.put("result", "noUser");
        }
        return map;
    }

    @Log(name = "退出登陆")
    @RequestMapping(value = "/userLogout", method = RequestMethod.GET)
    public void logOut(HttpServletRequest request, HttpServletResponse response) {

        if (request.getSession() != null) {
            UserInfoEntity currentPerson = (UserInfoEntity) request.getSession().getAttribute("currentPerson");
            request.getSession().removeAttribute("currentPerson");
            request.getSession().invalidate();
            System.out.println("用户：" + currentPerson.getUserName() + " 退出登陆");
        }
    }

}
