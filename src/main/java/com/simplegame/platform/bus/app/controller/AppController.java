package com.simplegame.platform.bus.app.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.simplegame.platform.bus.app.entity.App;
import com.simplegame.platform.bus.app.service.IAppService;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月29日 下午6:08:07
 *
 */
@RestController
@RequestMapping(value = "/console")
public class AppController {

    private Logger LOG = LogManager.getLogger(getClass());
    
    @Resource
    private IAppService appService;
    
    @RequestMapping(value = "/app")
    public ModelAndView list(Model model) {
        ModelAndView view = new ModelAndView("console/app");

        List<App> apps = appService.getAll();
        view.addObject("apps", apps);

        return view;
    }
  
    @RequestMapping("/app/update")
    public String update(String params) {
        LOG.info("app update: {}", params);
        
        JSONObject result = new JSONObject();
        
        App app = JSON.parseObject(params, App.class);
        appService.save(app);
        
        result.put("ret", 0);
        result.put("data", app);
        return result.toJSONString();
    }
    
    @RequestMapping("/app/remove")
    public String remove(long id) {
        JSONObject result = new JSONObject();
        
        appService.remove(id);
        
        result.put("ret", 0);
        return result.toJSONString();
    }
    
}
