package com.baizhi.service.Impl;

import com.baizhi.dao.GuruDao;
import com.baizhi.dao.UserDao;
import com.baizhi.entity.Guru;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.Md5Util;
import com.baizhi.util.SaltUtil;
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
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private GuruDao guruDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<User> queryAll() {
        List<User> users = userDao.selectAll();
        return users;
    }

    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public User queryById(String id)
    {
        User user = userDao.selectById(id);
        return user;
    }

    public void add(User user) {
        Guru guru = guruDao.selectById(user.getGuru().getId());
        String salt = SaltUtil.getSalt(4);
        user.setId(UUID.randomUUID().toString());
        user.setSalt(salt);
        user.setPassword(Md5Util.getMd5Code(user.getPassword()+salt));
        user.setGuru(guru);
        userDao.insert(user);

    }

    public void delete(String id) {
        userDao.delete(id);

    }

    public void change(User user) {
        userDao.update(user);

    }
}
