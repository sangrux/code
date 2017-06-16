package com.baizhi.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/6/12.
 */
public class Menu {
    private String id;
    private String name;
    private String photo;
    private String href;
    private List<Menu> children;

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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }

    public Menu() {
        super();
    }

    public Menu(String id, String name, String photo, String href, List<Menu> children) {
        this.id = id;
        this.name = name;
        this.photo = photo;
        this.href = href;
        this.children = children;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", photo='" + photo + '\'' +
                ", href='" + href + '\'' +
                ", children=" + children +
                '}';
    }
}
