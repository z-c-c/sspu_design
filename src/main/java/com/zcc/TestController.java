package com.zcc;

import com.zcc.commons.utils.MD5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zcc
 */
@Controller
@RequestMapping("/test")
public class TestController {

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET)
    public String test(String string) {

        System.out.println(string);
        //模拟的随机数
        String num = "23riklff#$@SDFQ";

        String name = "zcc";

        //模拟注册

        //加密后的姓名，即数据库里保存的姓名
        String nameed = MD5.md5("1", MD5.SOIL);
        System.out.println(nameed.equalsIgnoreCase(string));

        return "1";
    }
}
