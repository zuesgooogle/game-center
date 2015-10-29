package com.simplegame.platform.bus.app.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.simplegame.platform.bus.app.entity.App;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月29日 下午5:48:10
 *
 */
@Repository
public class AppDaoImpl implements IAppDao {

    @Resource
    public SqlSessionTemplate sqlSession;
    
    @Override
    public void insert(App app) {
        sqlSession.insert("insertApp", app);
    }

    @Override
    public int update(App app) {
        return sqlSession.update("updateApp", app);
    }

    @Override
    public int delete(long id) {
        return sqlSession.update("deleteApp", id);
    }

    @Override
    public App selectById(long id) {
        return sqlSession.selectOne("selectAppById", id);
    }

    @Override
    public List<App> selectAll() {
        return sqlSession.selectList("selectAppAll");
    }

    @Override
    public List<App> selectByUsername(String username) {
        return sqlSession.selectList("selectAppByUsername", username);
    }

}
