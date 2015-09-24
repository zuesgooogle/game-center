package com.simplegame.platform.bus.game.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月24日 上午11:15:07
 *
 */
@Controller
@RequestMapping("/game")
public class GameController {

    @PreAuthorize("hasAnyRole('USER')")
    @RequestMapping("/selectzone")
    public String selectZone() {
        return "selectzone";
    }
    
}
