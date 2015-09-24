package com.simplegame.platform.bus.user.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 
 * @Author zeusgooogle@gmail.com
 * @sine 2014年11月24日 下午12:27:36
 * 
 */

public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 注册用户后生产的唯一 UUID
     */
    private String id;

    private String username;

    private String password;

    /**
     * 用户类型
     */
    private int type;

    private Timestamp createTime;

    public User() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

}
