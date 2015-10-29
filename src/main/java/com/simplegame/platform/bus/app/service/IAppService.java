package com.simplegame.platform.bus.app.service;

import java.util.List;

import com.simplegame.platform.bus.app.entity.App;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月29日 下午5:54:23
 *
 */

public interface IAppService {

    public void createApp(App app);
    
    public void updateApp(App app);
    
    /**
     * 需要判断，是否关联区服
     * 
     * @param id
     */
    public void removeApp(long id);
    
    public List<App> getAll();
    
}
