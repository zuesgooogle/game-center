package com.simplegame.platform.bus.server.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.simplegame.platform.bus.server.entity.Server;
import com.simplegame.platform.bus.server.service.IServerService;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月24日 下午5:03:41
 *
 */
@Controller
public class ServerController {

    @Resource
    private IServerService serverService;
    
    @PreAuthorize("hasAnyRole('ADMIN')")
    @RequestMapping("server")
    public ModelAndView list() {
        ModelAndView view = new ModelAndView("console/server");
        
        List<Server> servers = serverService.getByAppId(0);
        view.addObject("servers", servers);
        
        return view;
    }
    
}
