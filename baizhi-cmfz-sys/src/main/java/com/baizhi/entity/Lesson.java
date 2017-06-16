package com.baizhi.entity;

import java.util.List;

/**
 * Created by acer1 on 2017/6/14.
 */
public class Lesson {

    private String id;
    private String type;
    private String name;
    //关系属性
    private User user;
    private List<Counter> counters;

    public Lesson() {
        super();
    }

    public Lesson(String id, String type, String name, User user, List<Counter> counters) {
        this.id = id;
        this.type = type;
        this.name = name;
        this.user = user;
        this.counters = counters;
    }

    @Override
    public String toString() {
        return "Lesson{" +
                "id='" + id + '\'' +
                ", type='" + type + '\'' +
                ", name='" + name + '\'' +
                ", user=" + user +
                ", counters=" + counters +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Counter> getCounters() {
        return counters;
    }

    public void setCounters(List<Counter> counters) {
        this.counters = counters;
    }
}
