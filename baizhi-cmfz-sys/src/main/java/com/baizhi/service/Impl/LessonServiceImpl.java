package com.baizhi.service.Impl;

import com.baizhi.dao.CounterDao;
import com.baizhi.dao.LessonDao;
import com.baizhi.dao.UserDao;
import com.baizhi.entity.Lesson;
import com.baizhi.entity.User;
import com.baizhi.service.LessonService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by acer1 on 2017/6/14.
 */
@Service("lessonService")
@Transactional
public class LessonServiceImpl implements LessonService {
    private static final Logger LOGGER = Logger.getLogger(LessonServiceImpl.class);

    @Autowired
    private LessonDao lessonDao;
    @Autowired
    private CounterDao counterDao;
    @Autowired
    private UserDao userDao;

    public void add(Lesson lesson) {
        //如果添加的是必修功课，则所有用户绑定该功课
        if (lesson.getType().equals("必修")){
            List<User> users = userDao.selectAll();
            for(User user:users){
                lesson.setUser(user);
            }
        }
        lesson.setId(UUID.randomUUID().toString());
        lessonDao.insert(lesson);
    }

    public void change(Lesson lesson) {
        lessonDao.update(lesson);
    }

    public void delete(String id) {
        /*Lesson lesson = lessonDao.selectById(id);
        if(lesson.getType().equals("必修")){
            List<User> users = userDao.selectAll();
            for(User user:users){
                lesson.setUser(user);
            }
        }*/
        lessonDao.delete(id);
        //同时删除相应的计时器
        counterDao.deleteByLessonId(id);
    }
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Lesson> queryByType() {
        List<Lesson> lessons = lessonDao.selectByType();
        return lessons;
    }

    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Lesson> queryAll() {
        List<Lesson> lessons = lessonDao.selectAll();
        return lessons;
    }
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Lesson queryById(String id) {

        LOGGER.debug(id);
        Lesson lesson = lessonDao.selectById(id);
        return lesson;
    }
}
