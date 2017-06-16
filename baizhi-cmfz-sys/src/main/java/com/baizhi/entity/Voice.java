package com.baizhi.entity;

import java.io.Serializable;

/**
 * Created by xumc on 2017/6/13.
 */
public class Voice implements Serializable {
    private String id;
    private String title;//第几集
    private String downloadUrl;//下载地址
    private Integer size;//音频大小
    private Integer duration;//音频时长
    //关系属性 多个章节对应一个妙音集
    private Introduce introduce;

    public Voice() {
        super();
    }

    public Voice(String id, String title, String downloadUrl, Integer size, Integer duration, Introduce introduce) {
        this.id = id;
        this.title = title;
        this.downloadUrl = downloadUrl;
        this.size = size;
        this.duration = duration;
        this.introduce = introduce;
    }

    @Override
    public String toString() {
        return "Voice{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", downloadUrl='" + downloadUrl + '\'' +
                ", size=" + size +
                ", duration=" + duration +
                ", introduce=" + introduce +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDownloadUrl() {
        return downloadUrl;
    }

    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Introduce getIntroduce() {
        return introduce;
    }

    public void setIntroduce(Introduce introduce) {
        this.introduce = introduce;
    }
}
