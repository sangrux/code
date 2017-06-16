package com.baizhi.dao;

import java.util.List;

/**
 * Created by Administrator on 2017/6/13.
 */
public interface BaseDao<T> {
    //查询所有
    public List<T> selectAll();
    //查询一个
    public T selectById(String id);
    //添加
    public void insert(T t);
    //删除
    public void delete(String id);
    //修改
    public void update(T t);
}
