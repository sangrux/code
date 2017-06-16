package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.Md5Util;
import com.baizhi.util.SaltUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/6/13.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<User> findAll(){
        List<User> users = userService.queryAll();
        System.out.println(users);
        return users;
    }

    @RequestMapping("/findOne")
    @ResponseBody
    public User findOne(String id){
        User user = userService.queryById(id);
        return user;
    }

    @RequestMapping("/add")
    @ResponseBody
    public void add(User user,String id){


        userService.add(user);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public void delete(String id){
        userService.delete(id);
    }

    @RequestMapping("update")
    @ResponseBody
    public void update(User user){
        userService.change(user);
    }

}
