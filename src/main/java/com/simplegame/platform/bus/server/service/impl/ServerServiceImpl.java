package com.simplegame.platform.bus.server.service.impl;

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
    public Server add(Server server) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int update(Server server) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int delete(Server server) {
        // TODO Auto-generated method stub
        return 0;
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