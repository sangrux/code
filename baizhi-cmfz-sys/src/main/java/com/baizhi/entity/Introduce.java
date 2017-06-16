package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by xumc on 2017/6/13.
 */
public class Introduce implements Serializable {
    private String id;
    private String photoPath;//缩略图
    private String title;//专辑名
    private Integer score;//分数
    private String author;//作者
    private String broadcast;//播音
    private Integer setCount;//集数
    private String brief;//内容简介
    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createDate;

    //关系属性：
    private List<Voice> voices;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBroadcast() {
        return broadcast;
    }

    public void setBroadcast(String broadcast) {
        this.broadcast = broadcast;
    }

    public Integer getSetCount() {
        return setCount;
    }

    public void setSetCount(Integer setCount) {
        this.setCount = setCount;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public List<Voice> getVoices() {
        return voices;
    }

    public void setVoices(List<Voice> voices) {
        this.voices = voices;
    }


    public Introduce() {
        super();
    }

    public Introduce(String id, String photoPath, String title, Integer score, String author, String broadcast, Integer setCount, String brief, Date createDate, List<Voice> voices) {
        this.id = id;
        this.photoPath = photoPath;
        this.title = title;
        this.score = score;
        this.author = author;
        this.broadcast = broadcast;
        this.setCount = setCount;
        this.brief = brief;
        this.createDate = createDate;
        this.voices = voices;
    }

    @Override
    public String toString() {
        return "Introduce{" +
                "id='" + id + '\'' +
                ", photoPath='" + photoPath + '\'' +
                ", title='" + title + '\'' +
                ", score=" + score +
                ", author='" + author + '\'' +
                ", broadcast='" + broadcast + '\'' +
                ", setCount=" + setCount +
                ", brief='" + brief + '\'' +
                ", createDate=" + createDate +
                ", voices=" + voices +
                '}';
    }
}
