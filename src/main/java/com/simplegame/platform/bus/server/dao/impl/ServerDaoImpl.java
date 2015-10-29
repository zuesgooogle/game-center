package com.simplegame.platform.bus.server.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.simplegame.platform.bus.server.dao.IServerDao;
import com.simplegame.platform.bus.server.entity.Server;

/**
 * @Author zeusgooogle@gmail.com
 * @sine   2015年9月30日 下午3:44:26 
 *
 */
@Repository
public class ServerDaoImpl implements IServerDao {

	@Resource
    public SqlSessionTemplate sqlSession;
	
	@Override
	public void insert(Server server) {
		sqlSession.insert("insertServer", server);
	}

	@Override
	public int update(Server server) {
		return sqlSession.update("updateServer", server);
	}

	@Override
	public int delete(long id) {
		return sqlSession.delete("deleteServer", id);
	}

	@Override
	public Server selectServerById(long id) {
		return sqlSession.selectOne("selectServerById", id);
	}

	@Override
	public List<Server> selectServerByAppId(long appId) {
		return sqlSession.selectList("selectServerByAppId", appId);
	}

    @Override
    public Server selectServerNewestByAppId(long appId) {
        return sqlSession.selectOne("selectServerNewestByAppId", appId);
    }

}
