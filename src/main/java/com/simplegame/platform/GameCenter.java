package com.simplegame.platform;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月16日 下午3:10:52
 *
 */

@SpringBootApplication
@EnableGlobalMethodSecurity(securedEnabled = true)
@ImportResource(value="classpath:config/spring/application-context.xml")
public class GameCenter {

    public static void main(String[] args) {
        SpringApplication.run(GameCenter.class, args);
    }

}
