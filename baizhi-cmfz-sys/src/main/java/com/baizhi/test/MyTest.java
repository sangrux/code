package com.baizhi.test;

import com.baizhi.dao.*;
import com.baizhi.entity.*;
import com.baizhi.service.AdminService;
import com.baizhi.service.CounterService;
import com.baizhi.service.LessonService;
import com.baizhi.service.UserService;
import com.baizhi.util.Md5Util;
import com.baizhi.util.SaltUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import javax.annotation.Resource;
import java.util.*;

/**
 * Created by Administrator on 2017/6/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-basic.xml")
public class MyTest {
    @Resource
    private LessonService lessonService;
    @Resource
    private UserService userService;
    @Resource
    private CounterService counterService;

    @Test
    public void test1(){
        User user = userService.queryById("cb9911e3-5db0-4f23-b3bf-9591b01ea3bf");

        lessonService.add(new Lesson(null,"选修","dgfh",user,null));
    }

        /*Admin admin=new Admin();
        String password="123456";
        String salt = SaltUtil.getSalt(4);
        admin.setId(UUID.randomUUID().toString());
        admin.setPassword(Md5Util.getMd5Code(password+salt));
        admin.setSalt(salt);
        admin.setName("张三");
        admin.setType("root");
        adminDao.insert(admin);
        List<Menu> menus = menuDao.selectAll();
        for(Menu menu:menus){
            System.out.println(menu);
        }*/
        //(new Lesson(null,"必修","stgr",user,null));
    /*ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-basic.xml");
    LessonDao lessonDao = (LessonDao) context.getBean("lessonDao");
    UserDao userDao = (UserDao) context.getBean("userDao");
    CounterDao counterDao = (CounterDao) context.getBean("counterDao");*/


    @Test
    public void test2(){
        Lesson lesson = lessonService.queryById("b9ac5ecc-7ce9-4648-9255-3c87edfbc958");

        counterService.add(new Counter(null,"大计数器",200,new Date(),lesson));
    }

}
