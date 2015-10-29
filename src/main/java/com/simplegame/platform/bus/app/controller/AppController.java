package com.simplegame.platform.bus.app.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.simplegame.platform.bus.app.entity.App;
import com.simplegame.platform.bus.app.service.IAppService;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月29日 下午6:08:07
 *
 */
@Controller
public class AppController {

    private Logger LOG = LogManager.getLogger(getClass());
    
    @Resource
    private IAppService appService;
    
    @PreAuthorize("hasAnyRole('ADMIN')")
    @RequestMapping("/app")
    public ModelAndView list() {
        ModelAndView view = new ModelAndView("console/app");
        
        List<App> apps = appService.getAll();
        view.addObject("apps", apps);
        
        return view;
    }
    
}
