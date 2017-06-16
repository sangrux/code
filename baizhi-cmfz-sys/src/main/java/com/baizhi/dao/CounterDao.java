package com.baizhi.dao;

import com.baizhi.entity.Counter;

import java.util.List;

/**
 * Created by acer1 on 2017/6/14.
 */
public interface CounterDao extends BaseDao<Counter> {

    //根据功课id查询
    List<Counter> selectByLessonId(String lessonId);
    //根据功课id 删除
    void deleteByLessonId(String LessonId);
}
