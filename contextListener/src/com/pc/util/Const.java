package com.pc.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
/**
 * 项目名称：
 * @author:fh
 * 
*/
public class Const {
	public static final String SESSION_SMS_LOGIN_CHECK = "sessionLOGINSMSCheck";
	public static final String SESSION_SMS_CHECK = "sessionSMSCheck";
	public static final String SESSION_SMS_LASTTIME = "sessionSMSLastTime";
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";
	public static final String SESSION_USER = "sessionUser";
	public static final String SESSION_ZF_USER = "sessionZfUser";//
	public static final String SESSION_ZF_BUSINESS_USER = "sessionZfBuUser";//商业用户登陆
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	
	public static final String SESSION_VIEW_RANDOM_ID = "sessionViewRandomId";
	
	public static final String SESSION_menuList = "menuList";			//当前菜单
	public static final String SESSION_allmenuList = "allmenuList";		//全部菜单
	
	public static final String SESSION_QX = "QX";
	public static final String SESSION_userpds = "userpds";			
	
	public static final String SESSION_USERROL = "USERROL";				//用户对象
	public static final String SESSION_USERNAME = "USERNAME";			//用户名
	
	public static final String TRUE = "T";
	public static final String FALSE = "F";
	public static final String LOGIN = "/login_toLogin.do";				//登录地址
	
	public static final String SYSNAME = "admin/config/SYSNAME.txt";	//系统名称路径
	public static final String PAGE	   = "admin/config/PAGE.txt";		//分页条数配置路径
	public static final String EMAIL   = "admin/config/EMAIL.txt";		//邮箱服务器配置路径
	public static final String SMS1   = "admin/config/SMS1.txt";		//短信账户配置路径1
	public static final String SMS2   = "admin/config/SMS2.txt";		//短信账户配置路径2
	public static final String FILEPATHIMG = "uploadFiles/uploadImgs/";	//图片上传路径
	public static final String FILEPATHFILE = "uploadFiles/file/";		//文件上传路径
	public static final String NO_INTERCEPTOR_PATH = ".*/((information)|(outside)|(sitemap)|(tools)|(linkPost.html)|(baidu.php)|(jpmSearch)|(area)|(mainIndex)|(weixin)|(newspage)|(enjoylife)|(favicon)|(sms)|(wj-mobile-static)|(mobile)|(wj-static)|(sms)|(checkCode)|(fundsflow)|(investrecord)|(myAccount)|(uploadFiles)|(autobid)|(publish)|(mainAd)|(zfReport)|(zfarticle)|(jingtai)|(login)|(register)|(logout)|(code)|(app)|(static)|(main)|(websocket)|(recharge)|(plugins)|(_project)|(drawcash)).*";	//不对匹配该值的访问路径拦截（正则）
	public static ApplicationContext WEB_APP_CONTEXT = null; //该值会在web容器启动时由WebAppContextListener初始化
	
	/**
	 * APP Constants
	 */
	//app注册接口_请求协议参数)
	public static final String[] APP_REGISTERED_PARAM_ARRAY = new String[]{"countries","uname","passwd","title","full_name","company_name","countries_code","area_code","telephone","mobile"};
	public static final String[] APP_REGISTERED_VALUE_ARRAY = new String[]{"国籍","邮箱帐号","密码","称谓","名称","公司名称","国家编号","区号","电话","手机号"};
	
	//app根据用户名获取会员信息接口_请求协议中的参数
	public static final String[] APP_GETAPPUSER_PARAM_ARRAY = new String[]{"USERNAME"};
	public static final String[] APP_GETAPPUSER_VALUE_ARRAY = new String[]{"用户名"};
	
	/**前后台通用控制器，后台只针对某个方法 进行全线拦截*/
	public static  List<String> GENERAL_METHOD_LIST = null;
	
	static{
		GENERAL_METHOD_LIST = new ArrayList<String>();
		GENERAL_METHOD_LIST.add("/_project/list.do");
	}
	

	
}
