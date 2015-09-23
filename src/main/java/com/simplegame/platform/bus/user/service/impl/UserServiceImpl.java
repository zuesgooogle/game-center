package com.simplegame.platform.bus.user.service.impl;

import java.sql.Timestamp;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.simplegame.platform.bus.user.dao.IUserDao;
import com.simplegame.platform.bus.user.entity.User;
import com.simplegame.platform.bus.user.service.IUserService;
import com.simplegame.platform.utils.Md5Util;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月23日 下午6:38:00
 *
 */
@Service
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;
    
    @Override
    public boolean exist(String account) {
        User user = userDao.selectUserByAccount(account);
        
        return user != null;
    }

    @Override
    public User createUser(String account, String password) {
        User user = new User();
        
        String id = UUID.randomUUID().toString();
        id = id.replaceAll("\\-", "").toUpperCase();
        
        user.setId(id);
        user.setAccount(account);
        user.setPassword(Md5Util.md5To32(password));
        user.setCreateTime(new Timestamp(System.currentTimeMillis()));
        
        userDao.insert(user);
        
        return user;
    }

}
