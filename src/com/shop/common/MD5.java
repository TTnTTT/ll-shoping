package com.shop.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

/**
 * MD5算法进行加密,一个字符串只有一个MD5编码
 * @author田何理
 *20190517
 */
public class MD5 {
	/**
	 * 
	 *利用MD5进行加密
     * @param str  待加密的字符串
     * @return  加密后的字符串
     * @throws NoSuchAlgorithmException  没有这种产生消息摘要的算法
     * @throws UnsupportedEncodingException  
	 */
	public static String toMD5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		//确定计算方法
		MessageDigest md=MessageDigest.getInstance("MD5");
  	    byte[] strByteArray=str.getBytes("utf-8");//使用utf-8编码 将此 String编码到 byte序列，并将结果存储到新的 byte 数组。
  	    byte[] mdByteArray=md.digest(strByteArray);//使用指定的 byte数组(此处为strByteArray)对摘要进行最后更新，然后完成摘要计算
  	    StringBuffer hexValue=new StringBuffer();
  	    for(int i=0;i<mdByteArray.length;i++){
  	    int val=((int)mdByteArray[i])&0xff;
  	    if(val<16){
  	    	hexValue.append("0");
  	    }
  	    hexValue.append(Integer.toHexString(val));
  	    }
  	    return hexValue.toString();
  	    
		/*//确定计算方法
        MessageDigest md5=MessageDigest.getInstance("MD5");
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
        return newstr;*/
}
	
}