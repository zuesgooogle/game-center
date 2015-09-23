package com.simplegame.platform.bus.user.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月22日 下午3:11:20
 *
 */
@RestController
@RequestMapping("/user")
public class UserController {

    private Logger LOG = LogManager.getLogger(getClass());
    
    @RequestMapping("/register")
    public String register(String account, String password) {
        JSONObject result = new JSONObject();
        
        LOG.info("account: {}, password: {}", account, password);
        
        return result.toJSONString();
    }
}
