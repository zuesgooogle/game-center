package com.simplegame.platform.bus.user.dao;

import com.simplegame.platform.bus.user.entity.User;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月22日 上午11:47:22
 *
 */

public interface IUserDao {
    
    public void insert(User user);
    
    public int update(User user);
    
    public int delete(String userId);
    
    public User selectUserById(String userId);
    
    public User selectUserByAccountAndPassword(String account, String password);

}
