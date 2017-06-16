package com.baizhi.dao;

import com.baizhi.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/6/12.
 */
public interface AdminDao extends BaseDao<Admin>{


    //验证登陆
    public Admin selectByName(String name);
}
