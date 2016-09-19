package com.pc.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
/**
 * 项目名称：
 * @author:fh
 * 
*/
public class WanjinConst {
	public static final String INDEX="/mainIndex/loginIndex.do";
	public static final String MAIN="/mobile/main";
	public static final String INVITATION="/mobile/invitation";
	public static final String INVITE="/mobile/personal/invite";
	public static final String SHARE="/mobile/share";//手机端分享
	public static final String RIGADD="/register/goAdd";//页面端邀请
	public static final String DISTINGUISH="/mainIndex/distinguish.do";//区分页面或手机浏览器

	public static final String NO_INTERCEPTOR_PATH = ".*/().*";	//不对匹配该值的访问路径拦截（正则）
	/**
	 * 推广
	 */
	public static final String GENERALIZE = "(yy|awb).*";
	

	
}
