package com.baizhi.service.Impl;

import com.baizhi.dao.PictureDao;
import com.baizhi.entity.Picture;
import com.baizhi.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/6/12.
 */
@Transactional
@Service
public class PictureServiceImpl implements PictureService {
    @Autowired
    private PictureDao pictureDao;

    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Picture> queryAll() {
        List<Picture> pictures = pictureDao.selectAll();
        return pictures;
    }

    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Picture queryById(String id) {
        Picture picture = pictureDao.selectById(id);
        return picture;
    }

    public void add(Picture picture) {

        picture.setId(UUID.randomUUID().toString());
        picture.setCreateDate(new Date());
        pictureDao.insert(picture);
    }

    public void delete(String id) {

        pictureDao.delete(id);
    }

    public void change(Picture picture) {
        picture.setCreateDate(new Date());
        pictureDao.update(picture);
    }
}
