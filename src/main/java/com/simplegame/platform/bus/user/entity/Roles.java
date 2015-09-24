package com.simplegame.platform.bus.user.entity;

/**
 * 
 * @Author zeusgooogle@gmail.com
 * @sine 2014年11月24日 下午2:15:33
 * 
 */

public enum Roles {

    USER(0, "USER"),

    ADMIN(1, "ADMIN")

    ;

    public int type;

    public String name;

    private Roles(int type, String name) {
        this.type = type;
        this.name = name;
    }

    public static Roles find(int type) {
        switch (type) {
        case 0:
            return USER;
        case 1:
            return ADMIN;
        default:
            new IllegalArgumentException("invalid role type: " + type);
        }
        return null;
    }
}
