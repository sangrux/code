package com.baizhi.dao;

import com.baizhi.entity.Voice;

import java.util.List;

/**
 * Created by xumc on 2017/6/13.
 * 对妙音章节表的操作
 */
public interface VoiceDao extends BaseDao<Voice>{
    /*查妙音集下的所有章节*/
    public List<Voice> selectByIntroductionId(String IntroductionId);
}
