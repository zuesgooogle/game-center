package com.simplegame.platform.bus.server.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import com.alibaba.fastjson.JSON;

/**
 * @Author zeusgooogle@gmail.com
 * @sine 2015年9月30日 下午3:14:29
 * 
 */
public class Server implements Serializable {

    /**
	 * 
	 */
    private static final long serialVersionUID = 1L;

    private long id;

    /**
     * 所属应用ID
     */
    private long appId;

    private String name;

    private String mysqlIp;

    private String mysqlName;

    private String mysqlUser;

    private String mysqlPass;

    private String serverIp;

    private String serverPort;

    /**
     * 游戏资源地址
     */
    private String resUrl;

    private int status;

    private Timestamp createTime;

    public Server() {

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getAppId() {
        return appId;
    }

    public void setAppId(long appId) {
        this.appId = appId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMysqlIp() {
        return mysqlIp;
    }

    public void setMysqlIp(String mysqlIp) {
        this.mysqlIp = mysqlIp;
    }

    public String getMysqlName() {
        return mysqlName;
    }

    public void setMysqlName(String mysqlName) {
        this.mysqlName = mysqlName;
    }

    public String getMysqlUser() {
        return mysqlUser;
    }

    public void setMysqlUser(String mysqlUser) {
        this.mysqlUser = mysqlUser;
    }

    public String getMysqlPass() {
        return mysqlPass;
    }

    public void setMysqlPass(String mysqlPass) {
        this.mysqlPass = mysqlPass;
    }

    public String getServerIp() {
        return serverIp;
    }

    public void setServerIp(String serverIp) {
        this.serverIp = serverIp;
    }

    public String getServerPort() {
        return serverPort;
    }

    public void setServerPort(String serverPort) {
        this.serverPort = serverPort;
    }

    public String getResUrl() {
        return resUrl;
    }

    public void setResUrl(String resUrl) {
        this.resUrl = resUrl;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
