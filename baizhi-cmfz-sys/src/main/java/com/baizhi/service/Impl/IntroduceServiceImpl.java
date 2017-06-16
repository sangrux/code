package com.baizhi.service.Impl;

import com.baizhi.dao.IntroduceDao;
import com.baizhi.dao.VoiceDao;
import com.baizhi.entity.Introduce;
import com.baizhi.entity.Voice;
import com.baizhi.service.IntroduceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/6/14.
 */
@Transactional
@Service
public class IntroduceServiceImpl implements IntroduceService {
    @Autowired
    private IntroduceDao introduceDao;
    @Autowired
    private VoiceDao voiceDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Introduce> queryAll() {
        List<Introduce> introduces = introduceDao.selectAll();
        return introduces;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public Introduce queryById(String id) {
        Introduce introduce = introduceDao.selectById(id);
        return introduce;
    }

    public void add(Introduce introduce) {
        introduce.setCreateDate(new Date());
        introduce.setSetCount(0);
        introduce.setId(UUID.randomUUID().toString());
        introduceDao.insert(introduce);
    }

    public void delete(String id) {
        introduceDao.delete(id);
        List<Voice> voices = voiceDao.selectByIntroductionId(id);
        for (Voice voice:voices){
            voiceDao.delete(voice.getId());
        }

    }

    public void change(Introduce introduce) {
        introduceDao.update(introduce);
    }
}
