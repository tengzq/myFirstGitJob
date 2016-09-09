package com.rcb.pc.frame;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import com.rcb.pc.authority.entity.User;

 /** 放置一些常量，比如UserKey什么的
 * 
 * @author maomh
 *
 */
public class AppConstant {
	
	//session 验证码 key
	public static final String SESSION_YZM_TOKEN=AppConstant.class.getName()+"Session_Yzm_Token";

	
  
	/**
	 * 
	 * 获取当前登陆
	 * @author SunLong
	 * @return UserEntity 
	 */
	public static User getUser (HttpServletRequest request){
		
		return (User)request.getSession().getAttribute("USER_SESSION_KEY");
	
	}
	
	
	/**
	 * 从session中获取验证码
	 * @param request
	 * @return 
	 */
	public static  String getYzmFromSession(HttpServletRequest request){
		return (String) request.getSession().getAttribute(SESSION_YZM_TOKEN);
	}
}


