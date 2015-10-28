package com.simplegame.platform.bus.user.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.simplegame.platform.bus.user.entity.User;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月23日 下午6:37:12
 *
 */

public interface IUserService extends UserDetailsService{

    /**
     * 账户是否存在
     * 
     * @param username
     * @return
     */
    boolean exist(String username);
    
    public User loadByName(String username);
    
    public User createUser(String username, String password);
    
}
