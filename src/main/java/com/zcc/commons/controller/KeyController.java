package com.zcc.commons.controller;

import com.zcc.commons.utils.MD5;
import com.zcc.commons.utils.ResultBean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @author zcc
 * 获取登录密钥
 */
@RestController
@RequestMapping("/key")
public class KeyController {

    private static String privateKey;

    @GetMapping("/")
    public ResultBean getKey() {
        Map<String, String> map = new HashMap<>(2);
        map.put("publicKey", MD5.SOIL);
        String key = UUID.randomUUID().toString();
        this.setPrivateKey(key);
        map.put("privateKey", key);
        return ResultBean.success(map);
    }


    public static String getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(String privateKey) {
        KeyController.privateKey = privateKey;
    }
}
