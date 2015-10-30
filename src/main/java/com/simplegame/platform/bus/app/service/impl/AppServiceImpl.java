package com.simplegame.platform.bus.app.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.simplegame.platform.bus.app.dao.IAppDao;
import com.simplegame.platform.bus.app.entity.App;
import com.simplegame.platform.bus.app.service.IAppService;
import com.simplegame.platform.utils.Md5Util;

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
    public void save(App app) {
        if( app.getId() == 0 ) {
            long time = System.currentTimeMillis();
            String key = Md5Util.md5To16( Md5Util.SECURE_KEY + time );
            
            app.setKey(key);
            app.setCreateTime(new Timestamp(time));
            
            appDao.insert(app);
        } else {
            appDao.update(app);
        }
    }

    @Override
    public void remove(long id) {
        // TODO Auto-generated method stub

    }

    @Override
    public List<App> getAll() {
        return appDao.selectAll();
    }


}
