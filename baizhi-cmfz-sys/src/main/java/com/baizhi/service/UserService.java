package com.baizhi.service;

import com.baizhi.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2017/6/13.
 */
public interface UserService {
    //展示所有
    public List<User> queryAll();
    //查询一个
    public User queryById(String id);
    //添加
    public void add(User user);
    //删除
    public void delete(String id);
    //修改
    public void change(User user);
}
