package com.simplegame.platform.bus.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月22日 下午3:11:20
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/login")
    public String about() {
        return "about";
    }
}
