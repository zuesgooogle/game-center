package com.simplegame.platform;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月16日 下午3:10:52
 *
 */

@SpringBootApplication
@ImportResource(value="classpath:config/spring/application-context.xml")
public class GamePlatform {

    public static void main(String[] args) {
        SpringApplication.run(GamePlatform.class, args);
    }

}
