package com.zcc.platform;

import com.zcc.exceptions.MyException;
import com.zcc.log.annotation.Log;
import com.zcc.platform.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zcc
 */
@Controller
@RequestMapping("/testController")
public class TestController {

    @Autowired
    private TestService service;

    @Log(name = "测试接口")
    @RequestMapping("/test")
    public String testMethod(Integer id,String name) throws MyException {
        service.test();
        return "/WEB-INF/success";
    }
}
