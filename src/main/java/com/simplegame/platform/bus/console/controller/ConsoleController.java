package com.simplegame.platform.bus.console.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月24日 下午4:26:26
 *
 */
@Controller
public class ConsoleController {

    @PreAuthorize("hasAnyRole('ADMIN')")
    @RequestMapping("/console")
    public String index() {
        return "console/index";
    }
    
}
