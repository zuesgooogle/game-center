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

    private String account;

    private String password;
    
    private Timestamp createTime;

    public User() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

}
