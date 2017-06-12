package com.baizhi.util;

import java.util.Random;

/**
 * 随机盐的工具�?
 * @author Mr
 *
 */
public class SaltUtil {
	/**
	 * 生成随机盐的方法
	 * @param n
	 * @return
	 */
	public static String getSalt(int n){
		char[] c = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()_+1234567890-=,./';[]".toCharArray();
		//生成随机�?
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < n; i++) {
			sb.append(c[random.nextInt(c.length)]);
		}
		return sb.toString();
	}
}
