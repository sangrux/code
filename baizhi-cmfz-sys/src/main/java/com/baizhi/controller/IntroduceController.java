package com.baizhi.controller;

import com.baizhi.entity.Introduce;
import com.baizhi.service.IntroduceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/6/14.
 */
@Controller
@RequestMapping("/introduce")
public class IntroduceController {

    @Resource
    private IntroduceService introduceService;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Introduce> findAll(){
        List<Introduce> introduces = introduceService.queryAll();
        return  introduces;
    }

    @RequestMapping("/findOne")
    @ResponseBody
    public Introduce findOne(String id){
        Introduce introduce = introduceService.queryById(id);
        return introduce;
    }

    @RequestMapping("/add")
    @ResponseBody
    public void add(Introduce introduce){
        introduceService.add(introduce);
    }

    @RequestMapping("/drop")
    @ResponseBody
    public void drop(String id){
        introduceService.delete(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public void update(Introduce introduce){
        introduceService.change(introduce);
    }

}
