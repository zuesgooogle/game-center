package com.simplegame.platform.bus.server.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.simplegame.platform.bus.server.dao.IServerDao;
import com.simplegame.platform.bus.server.entity.Server;
import com.simplegame.platform.bus.server.service.IServerService;

/**
 *
 * @Author zeusgooogle@gmail.com
 * @sine   2015年10月24日 下午5:06:47
 *
 */
@Service
public class ServerServiceImpl implements IServerService {

    @Resource
    private IServerDao serverDao;
    
    @Override
    public void save(Server server) {
    	if( server.getId() == 0 ) {
    		server.setCreateTime(new Timestamp(System.currentTimeMillis()));
    		serverDao.insert(server);
    	} else {
    		serverDao.update(server);
    	}
    }

    @Override
    public int remove(long id) {
        return serverDao.delete(id);
    }

    @Override
    public Server getById(long id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Server> getByAppId(long appId) {
        return serverDao.selectServerByAppId(0);
    }

}
