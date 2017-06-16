package com.baizhi.service;

import com.baizhi.entity.Guru;

import java.util.List;

/**
 * Created by Administrator on 2017/6/13.
 */
public interface GuruService {
    //添加
    public void add(Guru guru);
    //修改
    public void change(Guru guru);
    //删除
    public void delete(String id);
    //查询所有
    public List<Guru> queryAll();
    //查询一个
    public Guru queryOne(String id);
}
