package com.baizhi.service;

import com.baizhi.entity.Counter;

import java.util.List;

/**
 * Created by acer1 on 2017/6/14.
 */
public interface CounterService {

    //添加
    void add(Counter counter);

    //修改
    void change(Counter counter);

    //删除
    void delete(String id);

    //查询所有
    List<Counter> queryAll();

    //根据lessonId查询
    List<Counter> queryByLessonId(String lessonId);





}
