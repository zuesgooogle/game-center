package com.simplegame.platform.bus.user.controller;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.simplegame.platform.bus.user.entity.User;
import com.simplegame.platform.bus.user.service.IUserService;

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
    
    @Resource
    private IUserService userService;
    
    @RequestMapping("/register")
    public String register(String account, String password) {
        JSONObject result = new JSONObject();
        
        boolean exist = userService.exist(account);
        if( exist ) {
            result.put("ret", -1);
            result.put("msg", "账户已存在");
        }
        
        User user = userService.createUser(account, password);
        
        LOG.info("account: {}, password: {}, exist: {}", account, password, exist);
        
        result.put("ret", 0);
        
        
        return result.toJSONString();
    }
}
