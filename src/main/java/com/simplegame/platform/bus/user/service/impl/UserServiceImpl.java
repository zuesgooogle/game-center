package com.simplegame.platform.bus.user.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.simplegame.platform.bus.user.dao.IUserDao;
import com.simplegame.platform.bus.user.entity.Roles;
import com.simplegame.platform.bus.user.entity.User;
import com.simplegame.platform.bus.user.service.IUserService;

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
    
    @Resource
    private PasswordEncoder passwordEncoder;
    
    @Override
    public boolean exist(String username) {
        User user = userDao.selectUserByUsername(username);
        
        return user != null;
    }

    @Override
    public User createUser(String username, String password) {
        User user = new User();
        
        String id = UUID.randomUUID().toString();
        id = id.replaceAll("\\-", "").toUpperCase();
        
        user.setId(id);
        user.setUsername(username);
        user.setPassword( passwordEncoder.encode(password) );
        user.setCreateTime(new Timestamp(System.currentTimeMillis()));
        
        userDao.insert(user);
        
        return user;
    }

    @Override
    public User loadByName(String username) {
        return userDao.selectUserByUsername(username);
    }
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.selectUserByUsername(username);
        if(null == user) {
            return new org.springframework.security.core.userdetails.User(username, "", AuthorityUtils.NO_AUTHORITIES);
        }
        
        List<GrantedAuthority> auth = AuthorityUtils.commaSeparatedStringToAuthorityList(Roles.USER.name);
        if( user.getType() == Roles.ADMIN.type ) {
            auth = AuthorityUtils.createAuthorityList(Roles.ADMIN.name, Roles.USER.name);
        }
        String password = user.getPassword();
        
        return new org.springframework.security.core.userdetails.User(username, password, auth);
    }

}
