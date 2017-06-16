package com.baizhi.service;

import com.baizhi.entity.Voice;

import java.util.List;

/**
 * Created by xumc on 2017/6/13.
 */
public interface VoiceService {
    /*增*/
    public void add(Voice voice);
    /*删*/
    public void delete(String id);
    /*改*/
    public void change(Voice voice);
    /*查一个*/
    public Voice queryOne(String id);
    /*查所有*/
    public List<Voice> queryAll();

    /*根据外键查所有*/
    public List<Voice> selectByIntroductionId(String id);
}
