package com.baizhi.controller;

import com.baizhi.entity.Lesson;
import com.baizhi.service.CounterService;
import com.baizhi.service.LessonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/15.
 */
@Controller
@RequestMapping("/lesson")
public class LessonController {
    @Resource
    private LessonService lessonService;
    @Resource
    private CounterService counterService;

    @RequestMapping("/add")
    @ResponseBody
    public void add(Lesson lesson){
        lessonService.add(lesson);
     }

     @RequestMapping("/drop")
    @ResponseBody
    public void drop(String id){
         lessonService.delete(id);
     }

     @RequestMapping("/findAll")
    @ResponseBody
    public Map findAll(){
         Map map = new HashMap();
         List<Lesson> lessons = lessonService.queryAll();
         map.put("total",100);
         map.put("rows",lessons);
         return map;
     }

    @ResponseBody
    @RequestMapping("/delete")
    public void delete(String id){
        lessonService.delete(id);

    }

    @ResponseBody
    @RequestMapping("/change")
    public void change(Lesson lesson){
        lessonService.change(lesson);

    }


    @ResponseBody
    @RequestMapping("/queryById")
    public Lesson queryById(String id){
        Lesson lesson = lessonService.queryById(id);
        return lesson;
    }


    //展示所有必修功课
    @RequestMapping("/findAllMust")
    @ResponseBody
    public List<Lesson> findAllMust(){
        List<Lesson> lessons = lessonService.queryByType();
        return lessons;
    }



}
