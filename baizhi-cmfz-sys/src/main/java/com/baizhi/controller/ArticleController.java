package com.baizhi.controller;

import com.baizhi.entity.Article;
import com.baizhi.service.ArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by acer1 on 2017/6/15.
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Resource
    private ArticleService articleService;

    @RequestMapping("/add")
    @ResponseBody
    public Map add(Article article){
        articleService.add(article);
        return null;
    }
    @RequestMapping("/delete")
    @ResponseBody
    public Map delete(String id){
        articleService.delete(id);
        return null;
    }
    @RequestMapping("/change")
    @ResponseBody
    public Map change(Article article){
        articleService.change(article);
        return null;
    }
    @RequestMapping("/queryById")
    @ResponseBody
    public Article queryById(String id){
        Article article = articleService.queryById(id);
        return  article;
    }

    @RequestMapping("/queryAll")
    @ResponseBody
    public Map queryAll(){
        Map map = new HashMap();
        List<Article> articles = articleService.queryAll();
        map.put("rows",articles);
        map.put("total",100);
        return map;
    }


}
