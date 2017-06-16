package com.baizhi.service.Impl;

import com.baizhi.dao.ArticleDao;
import com.baizhi.entity.Article;
import com.baizhi.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by acer1 on 2017/6/15.
 */
@Service("/articleService")
@Transactional
public class ArticleServieImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;

    public void add(Article article) {
        article.setId(UUID.randomUUID().toString());
        article.setCreateDate(new Date());
        articleDao.insert(article);
    }

    public void delete(String id) {
        articleDao.delete(id);
    }

    public void change(Article article) {
        articleDao.update(article);
    }

    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Article queryById(String id) {
        Article article = articleDao.selectById(id);
        return article;
    }
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Article> queryAll() {
        List<Article> articles = articleDao.selectAll();
        return articles;
    }
}
