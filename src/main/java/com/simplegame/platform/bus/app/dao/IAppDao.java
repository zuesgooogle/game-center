package com.simplegame.platform.bus.app.dao;

import java.util.List;

import com.simplegame.platform.bus.app.entity.App;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月29日 下午5:42:50
 *
 */

public interface IAppDao {

    public void insert(App app);
    
    public int update(App app);
    
    public int delete(long id);
    
    public App selectById(long id);
    
    public List<App> selectAll();
    
    public List<App> selectByUsername(String username);
    
}
