package com.baizhi.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/6/13.
 */
public class Guru {
    private String id;
    private String name;
    private String photoPath;
    private List<User> users;

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

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public Guru() {
        super();
    }

    public Guru(String id, String name, String photoPath, List<User> users) {
        this.id = id;
        this.name = name;
        this.photoPath = photoPath;
        this.users = users;
    }

    @Override
    public String toString() {
        return "Guru{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", photoPath='" + photoPath + '\'' +
                ", users=" + users +
                '}';
    }
}

