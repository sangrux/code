package com.baizhi.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Md5工具方法的封�?
 * @author Mr
 *
 */
public class Md5Util {
	/**
	 * 用来生成md5加密结果
	 */
	public static String getMd5Code(String password){
		try {
			//加密算法
			MessageDigest messageDigest = MessageDigest.getInstance("md5");
			//加密
			byte[] digest = messageDigest.digest(password.getBytes());
			StringBuilder sb = new StringBuilder();
			for (byte b : digest) {
				int c = b & 0xff;
				if(c<16){
					sb.append("0");
				}
				sb.append(Integer.toHexString(c));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return password;
	}
}
