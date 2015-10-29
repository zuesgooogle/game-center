package com.simplegame.platform.bus.app.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import com.alibaba.fastjson.JSON;

/**
 * 
 * @Author zeusgooogle@gmail.com
 * @sine 2015年10月29日 下午5:27:53
 * 
 */

public class App implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private long id;

    private String name;

    private String key;

    /**
     * 所属人，创建app的用户名
     */
    private String username;

    private Timestamp createTime;

    public App() {

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
    
    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }

}
