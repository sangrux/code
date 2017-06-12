package com.baizhi.test;

import com.baizhi.util.Md5Util;
import com.baizhi.util.SaltUtil;

/**
 * Created by Administrator on 2017/6/12.
 */
public class Test {
    public static void main(String[] args) {
        String salt = SaltUtil.getSalt(4);
        System.out.println(salt);
    }
}
