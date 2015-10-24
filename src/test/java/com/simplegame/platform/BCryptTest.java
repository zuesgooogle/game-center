package com.simplegame.platform;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月21日 上午11:25:54
 *
 */

public class BCryptTest {

    @Test
    public void test() {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        
        String password = "renyuan1234!";
        
        String crypt = encoder.encode(password);
        System.out.println(crypt);
    }

}
