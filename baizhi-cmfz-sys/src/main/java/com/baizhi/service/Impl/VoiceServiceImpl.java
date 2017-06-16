package com.baizhi.service.Impl;

import com.baizhi.dao.IntroduceDao;
import com.baizhi.dao.VoiceDao;
import com.baizhi.entity.Introduce;
import com.baizhi.entity.Voice;
import com.baizhi.service.VoiceService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

/**
 * Created by xumc on 2017/6/13.
 */
@Transactional
@Service("/voiceService")
public class VoiceServiceImpl implements VoiceService {

    /*注入依赖*/
    @Resource
    private VoiceDao voiceDao;
    @Resource
    private IntroduceDao introduceDao;

    /*添加妙音章节，同时要选择对应的妙音集,然后使妙音集的count+1*/
    public void add(Voice voice) {
        /*uuid*/
        voice.setId(UUID.randomUUID().toString());
        /*根据外键将对应的妙音集找到，count+1再放回去*/
        System.out.println(voice.getIntroduce().getId()+"======================================");
        Introduce introduce = introduceDao.selectById(voice.getIntroduce().getId());
        Integer oldCount = introduce.getSetCount();
        Integer newCount= oldCount+1;
        introduce.setSetCount(newCount);
        introduceDao.update(introduce);
        /*插入数据库*/
        voiceDao.insert(voice);
    }

    /*删除妙音章节*/
    public void delete(String id) {
        Voice voice = voiceDao.selectById(id);
        Introduce introduce = voice.getIntroduce();
        Integer old = introduce.getSetCount();
        introduce.setSetCount(old-1);
        voiceDao.delete(id);
    }

    /*更改妙音章节信息*/
    public void change(Voice voice) {
        voiceDao.update(voice);
    }

    /*根据id查一个*/

    public Voice queryOne(String id) {
        Voice voice = voiceDao.selectById(id);
        return voice;
    }

    /*查所有妙音集*/

    public List<Voice> queryAll() {
        List<Voice> voices = voiceDao.selectAll();
        return voices;
    }

    /*根据外键id查所有*/
    public List<Voice> selectByIntroductionId(String id) {
        List<Voice> voices = voiceDao.selectByIntroductionId(id);
        return voices;
    }
}
