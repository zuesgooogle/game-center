package com.simplegame.platform.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月24日 上午11:11:16
 *
 */
@Configuration
public class WebMvcConfigurer extends WebMvcConfigurerAdapter {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/game").setViewName("game");
        
        registry.addViewController("/about").setViewName("about");
        
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/register").setViewName("register");
        registry.addViewController("/recharge").setViewName("recharge");

    }
}
