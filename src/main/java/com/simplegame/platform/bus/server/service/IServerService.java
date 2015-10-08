package com.simplegame.platform.bus.server.service;

import java.util.List;

import com.simplegame.platform.bus.server.entity.Server;

/**
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月30日 下午3:54:31 
 *
 */
public interface IServerService {

	public Server add(Server server);
	
	public int update(Server server);
	
	public int delete(Server server);
	
	public Server getById(long id);
	
	public List<Server> getByAppId(long appId);
}
