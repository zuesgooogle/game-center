package com.simplegame.platform.bus.server.dao;

import java.util.List;

import com.simplegame.platform.bus.server.entity.Server;

/**
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月30日 下午3:41:49 
 *
 */
public interface IServerDao {

	public void insert(Server server);
    
    public int update(Server server);
    
    public int delete(long id);
	
	public Server selectServerById(long id);
	
	public List<Server> selectServerByAppId(long appId);
	
	/**
	 * 获取最新，推荐服务器
	 * 
	 * @param appId
	 * @return
	 */
	public Server selectServerNewestByAppId(long appId);
	
}
