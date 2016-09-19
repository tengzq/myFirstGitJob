package com.pc.util;

import java.util.Random;

public class RandomStrUtil {
	
	/**
	 * 获取6为字母数字随机数
	 * @return
	 */
	public static String rand6(){
		String rand6="";
		for(int i=0;i<4;i++){
			rand6+=randomChar();
		}
		
		return rand6;
	}
	
	private static char randomChar(){
		Random r = new Random();
		String s = "abcdefghijklmnopqrstuvwxyz0123456789";
		return s.charAt(r.nextInt(s.length()));
	}
	
	public static String randNum(int length){
		Random r = new Random();
		String s = "1234567890";
		String result = "";
		for(int i=0;i<length;i++){
			result += s.charAt(r.nextInt(s.length()));
		}
		return result;
	}
	
	public static void main(String[] args){
		System.out.println(randNum(4));
	}
}
