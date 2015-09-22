package com.simplegame.platform.bus.user.dao.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.simplegame.platform.bus.user.dao.IUserDao;
import com.simplegame.platform.bus.user.entity.User;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月22日 上午11:49:41
 *
 */
@Repository
public class UserDaoImpl implements IUserDao {

    @Resource
    public SqlSessionTemplate sqlSession;
    
    @Override
    public void insert(User user) {

    }

    @Override
    public int update(User user) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int delete(String userId) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public User selectUserById(String userId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public User selectUserByAccountAndPassword(String account, String password) {
        // TODO Auto-generated method stub
        return null;
    }

}
