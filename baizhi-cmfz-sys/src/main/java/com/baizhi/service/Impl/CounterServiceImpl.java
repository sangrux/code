package com.baizhi.service.Impl;

import com.baizhi.dao.CounterDao;
import com.baizhi.entity.Counter;
import com.baizhi.service.CounterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by acer1 on 2017/6/14.
 */
@Service("counterService")
@Transactional
public class CounterServiceImpl implements CounterService {
    @Autowired
    private CounterDao counterDao;

    public void add(Counter counter) {
        counter.setId(UUID.randomUUID().toString());
        counter.setCreateTime(new Date());
        counterDao.insert(counter);
    }

    public void change(Counter counter) {
        counterDao.update(counter);
    }

    public void delete(String id) {
        counterDao.delete(id);
    }
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Counter> queryAll() {
        List<Counter> counters = counterDao.selectAll();
        return counters;
    }
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Counter> queryByLessonId(String lessonId) {
        List<Counter> counters = counterDao.selectByLessonId(lessonId);
        return counters;
    }
}
