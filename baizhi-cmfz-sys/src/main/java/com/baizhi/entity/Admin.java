package com.baizhi.entity;

/**
 * Created by Administrator on 2017/6/12.
 */

public class Admin {
    private String id;
    private String name;
    private String password;
    private String salt;
    private String type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Admin() {
        super();
    }

    public Admin(String id, String name, String password, String salt, String type) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.salt = salt;
        this.type = type;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
