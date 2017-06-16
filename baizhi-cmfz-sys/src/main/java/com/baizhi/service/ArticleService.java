package com.baizhi.service;

import com.baizhi.entity.Article;

import java.util.List;

/**
 * Created by acer1 on 2017/6/15.
 */
public interface ArticleService {

    //添加
    void add(Article article);

    //删除
    void delete(String id);

    //修改
    void change(Article article);

    //查询一个
    Article queryById(String id);

    //查询所有
    List<Article> queryAll();
}
