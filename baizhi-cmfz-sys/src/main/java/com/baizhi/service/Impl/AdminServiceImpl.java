package com.baizhi.service.Impl;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import com.baizhi.util.Md5Util;
import com.baizhi.util.SaltUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/6/12.
 */
@Transactional
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    public Admin checkById(Admin admin) {
        Admin admin1 = adminDao.selectByName(admin.getName());
        if(admin1!=null){
            if(admin1.getPassword().equals(Md5Util.getMd5Code(admin.getPassword()+admin1.getSalt()))){

                return admin1;
            }else{

                throw new RuntimeException("密码输入错误！！！");
            }
        }else{

            throw new RuntimeException("该用户不存在");
        }

    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Admin> queryAll() {
        List<Admin> admins = adminDao.selectAll();
        return admins;
    }

    public void add(Admin admin) {

        admin.setId(UUID.randomUUID().toString());
        String salt = SaltUtil.getSalt(4);
        admin.setSalt(salt);
        admin.setPassword(Md5Util.getMd5Code(admin.getPassword()+salt));

        adminDao.insert(admin);

    }

    public void delete(String id) {
        adminDao.delete(id);

    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public Admin queryById(String id){
        Admin admin = adminDao.selectById(id);
        return admin;
    }

    public void change(Admin admin) {
        Admin admin1 = adminDao.selectById(admin.getId());
        admin1.setPassword(Md5Util.getMd5Code(admin.getPassword()+admin1.getSalt()));
        adminDao.update(admin);

    }


}
