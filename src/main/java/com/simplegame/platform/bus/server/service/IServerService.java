package com.simplegame.platform.bus.server.service;

import java.util.List;

import com.simplegame.platform.bus.server.entity.Server;

/**
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月30日 下午3:54:31 
 *
 */
public interface IServerService {

	public void save(Server server);
	
	public int remove(long id);
	
	public Server getById(long id);
	
	public List<Server> getByAppId(long appId);
}
