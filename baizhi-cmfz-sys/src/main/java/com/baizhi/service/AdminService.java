package com.baizhi.service;

import com.baizhi.entity.Admin;

import java.util.List;

/**
 * Created by Administrator on 2017/6/12.
 */
public interface AdminService {
    //查询一个
    public Admin queryById(String id);
    //查询所有
    public List<Admin> queryAll();
    //添加
    public void add(Admin admin);
    //删除
    public void delete(String id);
    //修改
    public void change(Admin admin);
    //验证
    public Admin checkById(Admin admin);
}
