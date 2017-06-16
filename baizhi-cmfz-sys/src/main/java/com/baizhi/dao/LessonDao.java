package com.baizhi.dao;

import com.baizhi.entity.Lesson;

import java.util.List;

/**
 * Created by acer1 on 2017/6/14.
 */
public interface LessonDao extends BaseDao<Lesson> {

    //根据功课类型查询
    List<Lesson> selectByType();

}
