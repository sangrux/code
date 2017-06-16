package com.baizhi.service.Impl;

import com.baizhi.dao.GuruDao;
import com.baizhi.entity.Guru;
import com.baizhi.service.GuruService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/6/13.
 */
@Transactional
@Service
public class GuruServiceImpl implements GuruService {

    @Autowired
    private GuruDao guruDao;

    public void add(Guru guru) {
        guru.setId(UUID.randomUUID().toString());
        guruDao.insert(guru);

    }

    public void change(Guru guru) {
        guruDao.update(guru);
    }

    public void delete(String id) {
        guruDao.delete(id);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> queryAll() {
        List<Guru> gurus = guruDao.selectAll();
        return gurus;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public Guru queryOne(String id) {
        Guru guru = guruDao.selectById(id);
        return guru;
    }
}
