package com.zcc.platform;

import com.zcc.commons.utils.ResultBean;
import com.zcc.exceptions.MyException;
import com.zcc.log.annotation.Log;
import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import com.zcc.manager.tagmanager.service.TagBaseInfoService;
import com.zcc.platform.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author zcc
 */
@Controller
@RequestMapping("/testController")
public class TestController {

    @Autowired
    private TestService service;
    @Autowired
    private TagBaseInfoService tagBaseInfoService;

    @Log(name = "测试接口")
    @RequestMapping("/test")
    @ResponseBody
    public ResultBean testMethod(Integer id, String name) throws Exception {
        service.test();
        TagBaseInfoEntity tagBaseInfoEntity = new TagBaseInfoEntity();
        tagBaseInfoEntity.setTagName("测试标签");
        List<TagBaseInfoService> all = tagBaseInfoService.findAll();
        throw new Exception();
//        return ResultBean.success(tagBaseInfoEntity);
    }

}
