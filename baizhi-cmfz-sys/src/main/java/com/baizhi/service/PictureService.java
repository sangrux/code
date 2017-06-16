package com.baizhi.service;

import com.baizhi.entity.Picture;

import java.util.List;

/**
 * Created by Administrator on 2017/6/12.
 */
public interface PictureService {
    //展示所有
    public List<Picture> queryAll();
    //查询一个
    public Picture queryById(String id);
    //添加
    public void add(Picture picture);
    //删除
    public void delete(String id);
    //修改
    public void change(Picture picture);
}
