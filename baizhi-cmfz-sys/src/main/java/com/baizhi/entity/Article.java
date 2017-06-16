package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by acer1 on 2017/6/14.
 */
public class Article {
    private String id;
    private String title;
    private String link;
    private String author;
    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern ="yyyy-MM-dd" )
    private Date createDate;
    private String content;
    private String contentType;
    //关系属性上师
    private Guru guru;

    public Article() {
        super();
    }

    public Article(String id, String title, String link, String author, Date createDate, String content, String contentType, Guru guru) {
        this.id = id;
        this.title = title;
        this.link = link;
        this.author = author;
        this.createDate = createDate;
        this.content = content;
        this.contentType = contentType;
        this.guru = guru;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", link='" + link + '\'' +
                ", author='" + author + '\'' +
                ", createDate=" + createDate +
                ", content='" + content + '\'' +
                ", contentType='" + contentType + '\'' +
                ", guru=" + guru +
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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public Guru getGuru() {
        return guru;
    }

    public void setGuru(Guru guru) {
        this.guru = guru;
    }
}
