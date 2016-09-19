package com.pc.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.hslf.record.PPDrawing;


/**
 * 验证参数类
 * @author lilei
 *
 */
public class AuthParamsUtil {
	
	/**
	 * 验证Map中是否有值为null或为空字符串的参数**注意：如Map所有参数都不得为空时可使用
	 * @param params
	 * @return 有空字符串或null返回true
	 */
	public static boolean haveNullParam(Map<String,Object> params){
		if(null==params || params.size()<1){
			return true;
		}
		Set<String> keys=params.keySet();
		for(Iterator<String> it = keys.iterator();it.hasNext();){
			String s = it.next();
			if(null==params.get(s) || "".equals(params.get(s))){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 判断Map中指定的KEY的值是否为空
	 * @param params
	 * @param requiredParams 指定要检测的参数，多个以逗号分隔
	 * @return 其中一个为空返回true
	 */
	public static boolean haveNullParam(Map<String,Object> params,String requiredParams){
		if(null==params || params.size()<1){
			return true;
		}
		String[] required = requiredParams.split(","); 
		for(int i=0;i<required.length;i++){
			if(!params.containsKey(required[i]) || null==params.get(required[i]) || "".equals(params.get(required[i]))){
				return true;
			}
			
		}
		return false;
	}
	
	
	
	public static void main(String[] args){
		PageData p = new PageData();
		p.put("cc", new Date());
		p.put("array", new ArrayList());
		p.put("haha", "123");
		p.put("hehe", "123");
		if(haveNullParam(p,"haha,hehe,cc")){
			System.out.println("有空");
		}else{
			System.out.println("无空");
		}
		if(p.get("haha") instanceof List){
			System.out.println("是List");
		}else{
			System.out.println("不是List");
		}
	}
}
