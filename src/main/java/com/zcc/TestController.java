package com.zcc;

import com.zcc.commons.utils.Md5Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author zcc
 */
@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping(method = RequestMethod.GET)
    public String test(String string) {
        System.out.println(Md5Util.md5(string, Md5Util.SOIL));
        return "login";
    }
}
