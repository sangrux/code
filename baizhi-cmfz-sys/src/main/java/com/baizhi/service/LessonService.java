package com.baizhi.service;

import com.baizhi.entity.Lesson;

import java.util.List;

/**
 * Created by acer1 on 2017/6/14.
 */
public interface LessonService {

    //添加
    void add(Lesson lesson);
    //修改
    void change(Lesson lesson);
    //删除
    void delete(String id);
    //按类别查询
    List<Lesson> queryByType();
    //查询所有
    List<Lesson> queryAll();
    //根据id查询
    Lesson queryById(String id);
}
