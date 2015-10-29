package com.simplegame.platform.bus.app.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.simplegame.platform.bus.app.dao.IAppDao;
import com.simplegame.platform.bus.app.entity.App;
import com.simplegame.platform.bus.app.service.IAppService;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月29日 下午5:59:33
 *
 */
@Service
public class AppServiceImpl implements IAppService {

    @Resource
    private IAppDao appDao;
    
    @Override
    public void createApp(App app) {
        appDao.insert(app);
    }

    @Override
    public void updateApp(App app) {
        appDao.update(app);
    }

    @Override
    public void removeApp(long id) {
        // TODO Auto-generated method stub

    }

    @Override
    public List<App> getAll() {
        return appDao.selectAll();
    }

}
