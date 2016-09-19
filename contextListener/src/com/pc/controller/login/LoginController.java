package com.pc.controller.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pc.controller.BaseController;
import com.pc.entity.Menu;
import com.pc.entity.Role;
import com.pc.entity.User;
import com.pc.service.MenuService;
import com.pc.service.RoleService;
import com.pc.service.UserService;
import com.pc.util.AppUtil;
import com.pc.util.Const;
import com.pc.util.DateUtil;
import com.pc.util.PageData;
import com.pc.util.RightsHelper;
import com.pc.util.Tools;
/*
 * 总入口
 */
@Controller
public class LoginController extends BaseController {

	@Resource(name="userService")
	private UserService userService;
	@Resource(name="menuService")
	private MenuService menuService;
	@Resource(name="roleService")
	private RoleService roleService;
	
	/**
	 * 获取登录用户的IP
	 * @throws Exception 
	 */
	public void getRemortIP(String USERNAME) throws Exception {  
		PageData pd = new PageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		pd.put("USERNAME", USERNAME);
		pd.put("IP", ip);
		userService.saveIP(pd);
	}  
	
	
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/login_toLogin")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/admin/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 请求登录，验证用户
	 */
	@RequestMapping(value="/login_login" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").split(",fh,");
		
		if(null != KEYDATA && KEYDATA.length == 3){
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);		//获取session中的验证码
			
			String code = KEYDATA[2];
			if(null == code || "".equals(code)){
				errInfo = "nullcode"; //验证码为空
			}else{
				String USERNAME = KEYDATA[0];
				String PASSWORD  = KEYDATA[1];
				pd.put("USERNAME", USERNAME);
				if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)){
					String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString();	//密码加密
					//String passwd = MD5.md5(PASSWORD);
					pd.put("PASSWORD", passwd);
					pd = userService.getUserByNameAndPwd(pd);
					if(pd != null){
						pd.put("LAST_LOGIN",DateUtil.getTime().toString());
						userService.updateLastLogin(pd);
						User user = new User();
						user.setUSER_ID(pd.getString("USER_ID"));
						user.setUSERNAME(pd.getString("USERNAME"));
						user.setPASSWORD(pd.getString("PASSWORD"));
						user.setNAME(pd.getString("NAME"));
						user.setRIGHTS(pd.getString("RIGHTS"));
						user.setROLE_ID(pd.getString("ROLE_ID"));
						user.setLAST_LOGIN(pd.getString("LAST_LOGIN"));
						user.setIP(pd.getString("IP"));
						user.setSTATUS(pd.getString("STATUS"));
						user.setBelongTo((Long) pd.get("BELONG_TO"));
						session.setAttribute(Const.SESSION_USER, user);
						session.removeAttribute(Const.SESSION_SECURITY_CODE);
						
						//shiro加入身份验证
						Subject subject = SecurityUtils.getSubject(); 
					    UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
					    try { 
					        subject.login(token); 
					    } catch (AuthenticationException e) { 
					    	errInfo = "身份验证失败！";
					    }
					    
					}else{
						errInfo = "usererror"; 				//用户名或密码有误
					}
				}else{
					errInfo = "codeerror";				 	//验证码输入有误
				}
				if(Tools.isEmpty(errInfo)){
					errInfo = "success";					//验证成功
				}
			}
		}else{
			errInfo = "error";	//缺少参数
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 访问系统首页
	 */
	@RequestMapping(value="/main/{changeMenu}")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			
			User user = (User)session.getAttribute(Const.SESSION_USER);
			if (user != null) {
				
				User userr = (User)session.getAttribute(Const.SESSION_USERROL);
				if(null == userr){
					user = userService.getUserAndRoleById(user.getUSER_ID());
					session.setAttribute(Const.SESSION_USERROL, user);
				}else{
					user = userr;
				}
				Role role = user.getRole();
				String roleRights = role!=null ? role.getRIGHTS() : "";
				//避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
				session.setAttribute(Const.SESSION_ROLE_RIGHTS, roleRights); 		//将角色权限存入session
				session.setAttribute(Const.SESSION_USERNAME, user.getUSERNAME());	//放入用户名
				
				List<Menu> allmenuList = new ArrayList<Menu>();
				
				if(null == session.getAttribute(Const.SESSION_allmenuList)){
					allmenuList = menuService.listAllMenu();
					if(Tools.notEmpty(roleRights)){
						for(Menu menu : allmenuList){
							menu.setHasMenu(RightsHelper.testRights(roleRights, menu.getMENU_ID()));
							if(menu.isHasMenu()){
								List<Menu> subMenuList = menu.getSubMenu();
								for(Menu sub : subMenuList){
									sub.setHasMenu(RightsHelper.testRights(roleRights, sub.getMENU_ID()));
								}
							}
						}
					}
					session.setAttribute(Const.SESSION_allmenuList, allmenuList);			//菜单权限放入session中
				}else{
					allmenuList = (List<Menu>)session.getAttribute(Const.SESSION_allmenuList);
				}
				
				//切换菜单=====
				List<Menu> menuList = new ArrayList<Menu>();
				//if(null == session.getAttribute(Const.SESSION_menuList) || ("yes".equals(pd.getString("changeMenu")))){
				if(null == session.getAttribute(Const.SESSION_menuList) || ("yes".equals(changeMenu))){
					List<Menu> menuList1 = new ArrayList<Menu>();
					List<Menu> menuList2 = new ArrayList<Menu>();
					
					//拆分菜单
					for(int i=0;i<allmenuList.size();i++){
						Menu menu = allmenuList.get(i);
						if("1".equals(menu.getMENU_TYPE())){
							menuList1.add(menu);
						} else {
							menuList2.add(menu);
						}
					}
					
					session.removeAttribute(Const.SESSION_menuList);
					if("2".equals(session.getAttribute("changeMenu"))){
						session.setAttribute(Const.SESSION_menuList, menuList1);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "1");
						menuList = menuList1;
					}else{
						session.setAttribute(Const.SESSION_menuList, menuList2);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "2");
						menuList = menuList2;
					}
				}else{
					menuList = (List<Menu>)session.getAttribute(Const.SESSION_menuList);
				}
				//切换菜单=====
				
				if(null == session.getAttribute(Const.SESSION_QX)){
					
					session.setAttribute(Const.SESSION_QX, this.getUQX(session));	//按钮权限放到session中
					
				}
				
				//FusionCharts 报表
			 	String strXML = "<graph caption='前12个月订单销量柱状图' xAxisName='月份' yAxisName='值' decimalPrecision='0' formatNumberScale='0'><set name='2013-05' value='4' color='AFD8F8'/><set name='2013-04' value='0' color='AFD8F8'/><set name='2013-03' value='0' color='AFD8F8'/><set name='2013-02' value='0' color='AFD8F8'/><set name='2013-01' value='0' color='AFD8F8'/><set name='2012-01' value='0' color='AFD8F8'/><set name='2012-11' value='0' color='AFD8F8'/><set name='2012-10' value='0' color='AFD8F8'/><set name='2012-09' value='0' color='AFD8F8'/><set name='2012-08' value='0' color='AFD8F8'/><set name='2012-07' value='0' color='AFD8F8'/><set name='2012-06' value='0' color='AFD8F8'/></graph>" ;
			 	mv.addObject("strXML", strXML);
			 	//FusionCharts 报表
			 	
				mv.setViewName("system/admin/index");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
			}else {
				mv.setViewName("system/admin/login");//session失效后跳转登录页面
			}
			
			
		} catch(Exception e){
			mv.setViewName("system/admin/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/admin/tab";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 *//*
	@RequestMapping(value="/login_default")
	public ModelAndView defaultPage(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd.put("WOM", 1);
		String pcDailyXml = viewLogService.getDailyViewGraphXml(pd);
		pd.put("WOM", 2);
		String mobileDailyXml = viewLogService.getDailyViewGraphXml(pd);
		String hours = (String) MiceConfig.getContextProperty("background_project_reminds_time");
		long currentTime = System.currentTimeMillis() + (Integer.parseInt(hours) * 60 * 60* 1000);
		Date date = new Date(currentTime);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String after = df.format(date);
		String now = df.format(new Date());
		PageData where = new PageData();
		where.put("AFTER", after);
		where.put("NOW", now);
		List<PageData> list = new ArrayList<PageData>();
		List<PageData> tempPayment = new ArrayList<PageData>();
		List<PageData> payment = new ArrayList<PageData>();
		try {
			currentTime = System.currentTimeMillis();
			Calendar c = Calendar.getInstance();  
			list = _projectService.findAmlostEndProject(where);
			for (PageData p : list) {
				long time = c.getTimeInMillis() + (Integer.parseInt(p.get("DEADLINE").toString()) * 1000 * 60 * 60 * 24);
					Date d  = new Date(time);
					String repaymentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
					p.put("REPAYMENT_TIME", repaymentTime);
			}
			tempPayment = _projectService.findPaymentProject();
			for (PageData p : tempPayment) {
				c.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(p.get("END_DATE").toString()));
				long time = c.getTimeInMillis() + (Integer.parseInt(p.get("DEADLINE").toString()) * 1000 * 60 * 60 * 24);
				long howFar = time - currentTime;
				if (howFar > 0 && howFar < (Integer.parseInt(hours) * 60 * 60* 1000)) {
					Date d  = new Date(time);
					String repaymentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
					p.put("REPAYMENT_TIME", repaymentTime);
					payment.add(p);
				}
			}
			
		} catch (Exception e) {
			logger.error(e.toString(), e);		
		}
		
		//-----------------------
		PageData countLoginTimes = new PageData();
		countLoginTimes = this.getPageData();
		// 统计人数
		List<PageData> personCount = null;
		try {
			personCount = countService.personCount(countLoginTimes);
		} catch (Exception e) {
			logger.error(e.toString(), e);	
		}
		countLoginTimes.put("personCount", personCount);
		
		System.out.println(personCount);
		
		//-----------------------
		mv.addObject("projectList", list);
		mv.addObject("payment", payment);
		mv.addObject("pc", pcDailyXml);
		mv.addObject("mobile", mobileDailyXml);
		mv.setViewName("system/admin/default");
		return mv;
	}
	*/
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		
		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(Const.SESSION_allmenuList);
		session.removeAttribute(Const.SESSION_menuList);
		session.removeAttribute(Const.SESSION_QX);
		session.removeAttribute(Const.SESSION_userpds);
		session.removeAttribute(Const.SESSION_USERNAME);
		session.removeAttribute(Const.SESSION_USERROL);
		session.removeAttribute("changeMenu");
		
		//shiro销毁登录
		Subject subject = SecurityUtils.getSubject(); 
		subject.logout();
		
		pd = this.getPageData();
		String  msg = pd.getString("msg");
		pd.put("msg", msg);
		
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/admin/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 获取用户权限
	 */
	public Map<String, String> getUQX(Session session){
		PageData pd = new PageData();
		Map<String, String> map = new HashMap<String, String>();
		try {
			String USERNAME = session.getAttribute(Const.SESSION_USERNAME).toString();
			pd.put(Const.SESSION_USERNAME, USERNAME);
			String ROLE_ID = userService.findByUId(pd).get("ROLE_ID").toString();
			
			pd.put("ROLE_ID", ROLE_ID);
			
			PageData pd2 = new PageData();
			pd2.put(Const.SESSION_USERNAME, USERNAME);
			pd2.put("ROLE_ID", ROLE_ID);
			
			pd = roleService.findObjectById(pd);
			
				
			pd2 = roleService.findGLbyrid(pd2);
			if(null != pd2){
				map.put("FX_QX", pd2.get("FX_QX").toString());
				map.put("FW_QX", pd2.get("FW_QX").toString());
				map.put("QX1", pd2.get("QX1").toString());
				map.put("QX2", pd2.get("QX2").toString());
				map.put("QX3", pd2.get("QX3").toString());
				map.put("QX4", pd2.get("QX4").toString());
			
				pd2.put("ROLE_ID", ROLE_ID);
				pd2 = roleService.findYHbyrid(pd2);
				map.put("C1", pd2.get("C1").toString());
				map.put("C2", pd2.get("C2").toString());
				map.put("C3", pd2.get("C3").toString());
				map.put("C4", pd2.get("C4").toString());
				map.put("Q1", pd2.get("Q1").toString());
				map.put("Q2", pd2.get("Q2").toString());
				map.put("Q3", pd2.get("Q3").toString());
				map.put("Q4", pd2.get("Q4").toString());
			}
			
			map.put("adds", pd.getString("ADD_QX"));
			map.put("dels", pd.getString("DEL_QX"));
			map.put("edits", pd.getString("EDIT_QX"));
			map.put("chas", pd.getString("CHA_QX"));
			
			//System.out.println(map);
			
			this.getRemortIP(USERNAME);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}	
		return map;
	}
	/**
	 * 统计从今天到过去15天每天登陆的人数
	*/
	/*@RequestMapping(value="/personCount")
	@ResponseBody
	public Object personCount(HttpServletRequest request){
		PageData pd = new PageData();
		pd = this.getPageData();
		// 统计人数
		List<PageData> personCount = null;
		try {
			personCount = countService.personCount(pd);
		} catch (Exception e) {
		}
		pd.put("personCount", personCount);
		return pd;
	}*/
	/**
	 * 统计从今天到过去15天新增人数
	*/
	/*@RequestMapping(value="/addCount")
	@ResponseBody
	public Object addCount(HttpServletRequest request){
		PageData pd = new PageData();
		pd = this.getPageData();
		// 统计人数
		List<PageData> addCount = null;
		try {
			addCount = countService.addCount(pd);
		} catch (Exception e) {
		}
		pd.put("addCount", addCount);
		return pd;
	}*/
	
	/*@RequestMapping(value="/countProject")
	@ResponseBody
	public Object countProject(HttpServletRequest request){
		PageData pd = new PageData();
		pd = this.getPageData();
		// 统计人数
		List<PageData> addCount = null;
		try {
			addCount = countService.countProject(pd);
		} catch (Exception e) {
		}
		pd.put("countProject", addCount);
		return pd;
	}*/
	/**
	 * 统计累计投资金额
	 */
/*	@RequestMapping(value="/addMoney")
	@ResponseBody
	public Object addMoney(HttpServletRequest request){
		PageData pd = new PageData();
		pd = this.getPageData();
		// 统计金额
		List<PageData> addMoney = null;
		try {
			addMoney = countService.addMoney(pd);
		} catch (Exception e) {
		}
		pd.put("addMoney", addMoney);
		return pd;
	}*/
	/**
	 * 统计累计投资人数
	 */
	/*@RequestMapping(value="/investPerson")
	@ResponseBody
	public Object investPerson(HttpServletRequest request){
		PageData pd = new PageData();
		pd = this.getPageData();
		// 统计人数
		List<PageData> investPerson = null;
		try {
			investPerson = countService.investPerson(pd);
		} catch (Exception e) {
		}
		pd.put("investPerson", investPerson);
		return pd;
	}*/
//	/**
//	 * 统计已完成项目数量
//	 */
//	@RequestMapping(value="/finishProject")
//	@ResponseBody
//	public Object finishProject(HttpServletRequest request){
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		// 统计项目
//		List<PageData> finishProject = null;
//		try {
//			finishProject = countService.finishProject(pd);
//		} catch (Exception e) {
//		}
//		pd.put("finishProject", finishProject);
//		return pd;
//	}
	/**
	 *  统计
	 */
	/*@RequestMapping(value="/count")
	@ResponseBody
	public Object count(HttpServletRequest request){
		PageData pd = new PageData();
		pd = this.getPageData();
		// 统计今日登陆人数
		List<PageData> todayCount = null;
		//统计注册人数
		List<PageData> registerCount = null;
		// 统计今日新增投资人数 
		List<PageData> newCount = null;
		//统计累计投资人数
		List<PageData> totalCount = null;
		//统计今日投资金额
		List<PageData> todayMoney = null;
		//统计累计投资金额
		List<PageData> allMoney = null;
		//统计理财产品总数
		List<PageData> allProject = null;
		//统计已完成项目数量
		List<PageData> finishProject = null;
		try {
			todayCount = countService.todayCount(pd);
			registerCount = countService.registerCount(pd);
			newCount = countService.newCount(pd);
			totalCount = countService.totalCount(pd);
			todayMoney = countService.todayMoney(pd);
			allMoney = countService.allMoney(pd);
			allProject = countService.allProject(pd);
			finishProject = countService.finishProject(pd);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		pd.put("todayCount", todayCount);
		pd.put("registerCount", registerCount);
		pd.put("newCount", newCount);
		pd.put("totalCount", totalCount);
		pd.put("todayMoney", todayMoney);
		pd.put("allMoney", allMoney);
		pd.put("allProject", allProject);
		pd.put("finishProject", finishProject);
		return pd;
	}*/
}
