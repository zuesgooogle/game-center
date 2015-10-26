package com.simplegame.platform.bus.server.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.simplegame.platform.bus.server.entity.Server;
import com.simplegame.platform.bus.server.service.IServerService;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月24日 下午5:03:41
 *
 */
@RestController
public class ServerController {

	private Logger LOG = LogManager.getLogger(getClass());
	
    @Resource
    private IServerService serverService;
    
    @PreAuthorize("hasAnyRole('ADMIN')")
    @RequestMapping("/server")
    public ModelAndView list() {
        ModelAndView view = new ModelAndView("console/server");
        
        List<Server> servers = serverService.getByAppId(0);
        view.addObject("servers", servers);
        
        return view;
    }
    
    @PreAuthorize("hasAnyRole('ADMIN')")
    @RequestMapping("/server/update")
    public String update(String params) {
    	LOG.info("server update: {}", params);
    	
    	JSONObject result = new JSONObject();
    	
    	Server server = JSON.parseObject(params, Server.class);
    	serverService.save(server);
    	
    	result.put("ret", 0);
    	return result.toJSONString();
    }
    
    @PreAuthorize("hasAnyRole('ADMIN')")
    @RequestMapping("/server/remove")
    public String remove(long id) {
        JSONObject result = new JSONObject();
        
        serverService.remove(id);
        
        result.put("ret", 0);
        return result.toJSONString();
    }
    
    @PreAuthorize("hasAnyRole('USER')")
    @RequestMapping("/selectzone")
    public ModelAndView selectzone() {
        ModelAndView view = new ModelAndView("selectzone");
        
        List<Server> servers = serverService.getByAppId(0);
        view.addObject("servers", servers);
        
        return view;
    }
}
