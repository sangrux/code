package com.baizhi.dao;

import com.baizhi.entity.Guru;

import java.util.List;


/**
 * Created by Administrator on 2017/6/13.
 */
public interface GuruDao extends BaseDao<Guru>{
    public Guru selectById(String id);

}
