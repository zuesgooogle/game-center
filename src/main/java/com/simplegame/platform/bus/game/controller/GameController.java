package com.simplegame.platform.bus.game.controller;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.simplegame.platform.bus.server.entity.Server;
import com.simplegame.platform.bus.server.service.IServerService;
import com.simplegame.platform.bus.user.entity.User;
import com.simplegame.platform.bus.user.service.IUserService;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月24日 上午11:15:07
 *
 */
@Controller
public class GameController {

    private Logger LOG = LogManager.getLogger(getClass());
    
    @Resource
    private IUserService userService;
    
    @Resource
    private IServerService serverService;
    
    /**
     * 1. 用户已经登录，读取最后一次登录的服务器
     *    1.1 用户重来没进入过游戏，推荐最新服务
     *    
     * 2. 用户未登录，推荐最新服务
     * 
     * @return
     */
    @RequestMapping("/game")
    public ModelAndView game() {
        ModelAndView view = new ModelAndView("game");
    
        boolean online = userService.isOnline();
        LOG.info("user online: {}", online );

        if( online ) {
            User user = userService.loadByName(userService.getOnlineUsername());
            
            //JSONArray games = JSONArray.parse(user.get)
            
        } else {
            Server server = serverService.getNewestByAppId(0);
            
            view.addObject("serverId", server.getId());
        }
        
        return view;
    }

}
