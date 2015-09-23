package com.simplegame.platform.bus.user.service;

import com.simplegame.platform.bus.user.entity.User;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月23日 下午6:37:12
 *
 */

public interface IUserService {

    /**
     * 账户是否存在
     * 
     * @param account
     * @return
     */
    boolean exist(String account);
    
    public User createUser(String account, String password);
    
}
