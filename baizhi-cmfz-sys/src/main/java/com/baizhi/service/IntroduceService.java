package com.baizhi.service;

import com.baizhi.entity.Introduce;

import java.util.List;

/**
 * Created by Administrator on 2017/6/14.
 */
public interface IntroduceService {
    //查询所有
    public List<Introduce> queryAll();
    //查询一个
    public Introduce queryById(String id);
    //添加
    public void add(Introduce introduce);
    //删除
    public void delete(String id);
    //修改
    public void change(Introduce introduce);
}
