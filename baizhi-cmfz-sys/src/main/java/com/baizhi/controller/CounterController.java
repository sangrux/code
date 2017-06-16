package com.baizhi.controller;

import com.baizhi.entity.Counter;
import com.baizhi.service.CounterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/6/16.
 */
@Controller
@RequestMapping("/counter")
public class CounterController {

    @Resource
    private CounterService counterService;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Counter> findAll(){
        List<Counter> counters = counterService.queryAll();
        return counters;
    }

}
