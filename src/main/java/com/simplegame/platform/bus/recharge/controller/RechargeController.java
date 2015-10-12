package com.simplegame.platform.bus.recharge.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月25日 下午5:33:40
 *
 */
@Controller
@RequestMapping("/recharge")
public class RechargeController {

	public final Logger LOG = LogManager.getLogger(getClass());
	
	@PreAuthorize("hasAnyRole('USER')")
    @RequestMapping("/detail")
    public ModelAndView detail(int serverId, int priceRadio, String typeRadio) {
		LOG.info("serverId: {}, price: {}, type: {}", serverId, priceRadio, typeRadio);
		
		ModelAndView view = new ModelAndView("rechargedetail");
		view.addObject("serverId", serverId);
		view.addObject("price", priceRadio);
		view.addObject("type", typeRadio);
		
        return view;
    }

	
}
