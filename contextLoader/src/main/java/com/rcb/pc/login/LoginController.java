package com.rcb.pc.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rcb.pc.authority.entity.User;
import com.rcb.pc.frame.AppConstant;
import com.rcb.pc.frame.base.DwzResponse;
import com.rcb.pc.frame.base.Md5;
import com.rcb.pc.frame.kit.JsonKit;
import com.rcb.pc.frame.kit.StringKit;
import com.rcb.pc.log.entity.LoginLogEntity;
import com.rcb.pc.log.service.LoginLogService;
import com.rcb.pc.login.service.LoginService;

/**
 * 登陆相关控制器
 * 
 * @author tzq
 *
 */
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	
	@Autowired
	private LoginLogService logService;
	/**
	 * 登陆页
	 * 
	 * @return
	 */
	@RequestMapping("/toLogin")
	public String toLogin(HttpServletRequest request,HttpServletResponse response) {
		if (StringUtils.equals("XMLHttpRequest", request.getHeader("X-Requested-With"))
				|| StringUtils.isNotEmpty(request.getParameter("ajax"))) {
			return "ajaxlogin";
		}
		return "login";
	}
	
	/**
	 * 执行登陆操作
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/doLogin")
	public String doLogin(User user,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		//验证码 -zhangkedong 2015-4-15
		String token = AppConstant.getYzmFromSession(request);
		String yzm_code = request.getParameter("yzm_code");
		String formUserName = user.getName();
		System.out.println(formUserName);
		HttpSession session =request.getSession();
		if (StringUtils.isNotBlank(token)&&token.equals(yzm_code)) {
			
			// 用户名为空
			if(StringKit.isBlank(user.getName())) {
				request.setAttribute("loginError", "用户名不能为空！");
				return "login";
			}

			// 密码为空
			if(StringKit.isBlank(user.getPassword())){
				request.setAttribute("loginError", "密码不能为空！");
				return "login";
			}else{
				//user.setPassword(Md5.getMD5(user.getPassword()));
			}
			
			Map<String,Object> userMap = loginService.login(user);
			User queryUser = (User) userMap.get("user");
			LoginLogEntity loginLog = new LoginLogEntity();
			//String ipAddress = request.getRemoteAddr();
			//获取ip
			String ipAddress = InetAddress.getLocalHost().getHostAddress();
			Date loginDate = new Date();
			loginLog.setIpAddress(ipAddress);
			loginLog.setLoginTime(loginDate);
			// 读取system_reset.properties 初始化 用户名
			Properties p =new Properties();
			p.load(request.getServletContext().getResourceAsStream("WEB-INF/system_reset.properties"));
			String userName = p.getProperty("system.reset.user");
			String show = p.getProperty("system.reset.show");
			
			// 用户名不存在
			if(StringKit.isBlank(queryUser.getName())) {
				
				// 用户名不存在，但输入用户名为默认初始化系统的名字
				if(formUserName.equals(userName) && show.equals("true")) {
					//user.setFunctions(initializeService.getInitializeFunction());
					//List<MenuEntity> menuList = initializeService.getInitializeMenu();
					//user.getMenus().addAll(menuList);
					session.setAttribute("USER_SESSION_KEY", user);
					request.setAttribute("USER_KEY",user);
					// 登陆日志
					loginLog.setRealName(user.getName());
					loginLog.setDescriptions("登陆成功：系统初始化");
					loginLog.setSessionId(session.getId());
					logService.loginLog(loginLog);
					
					return "index";
				}else {
					request.setAttribute("loginError", "用户名不存在！");
					// 登陆日志
					
					loginLog.setDescriptions("登陆失败：用户名不存在");
					logService.loginLog(loginLog);
					return "login";
				}
				
			}else if(StringKit.isNotBlank((String) userMap.get("state")) && userMap.get("state").equals("pwdNull")) {
				request.setAttribute("loginError", "密码错误！");
				// 登陆日志
				
				loginLog.setDescriptions("登陆失败：密码错误");
				logService.loginLog(loginLog);
				return "login";
				
			
			}else {
				//SupplyMarketEntity sm = loginService.queryNode();
				session.setAttribute("USER_SESSION_KEY", queryUser);
				request.setAttribute("USER_KEY",queryUser);
				//request.getServletContext().setAttribute("NODE_INFO", sm);
				// 登陆日志
				//loginLog.setRealName(queryUser.getRealName());
				//loginLog.setUserId(queryUser.getUserId());
				//loginLog.setUserName(queryUser.getUserName());
				//loginLog.setDescriptions("登陆成功");
				//loginLog.setSessionId(session.getId());
				//logService.loginLog(loginLog);
				return "index";
			}
		}
		else {
			request.setAttribute("yzmError", "验证码不正确！");
			return "login";
		}
	}
	
	/**
	 * 执行session失效后的ajax请求
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/doAjaxLogin")
	public void doAjaxLogin(User user,HttpServletRequest request,HttpServletResponse response) throws IOException {
		DwzResponse dr =new DwzResponse();
		user.setPassword(Md5.getMD5(user.getPassword()));
		Map<String,Object> userMap = loginService.login(user);
		User queryUser = (User) userMap.get("user");
		if(queryUser!=null&&queryUser.getUserId()!=0){
			//SupplyMarketEntity sm = loginService.queryNode();
			HttpSession session =request.getSession();
			session.setAttribute("USER_SESSION_KEY", queryUser);
			request.setAttribute("USER_KEY",queryUser);
			//request.getServletContext().setAttribute("NODE_INFO", sm);
			dr.setCallbackType(DwzResponse.CT_CLOSE);
			dr.setMessage("登陆成功！");
			PrintWriter pw=response.getWriter();
			String strJson=JsonKit.toJSON(dr);
			pw.write(strJson);
			pw.flush();
			pw.close();
		}else{
			dr.setStatusCode(DwzResponse.SC_ERROR);
			dr.setMessage("用户名或密码不正确！");
			PrintWriter pw=response.getWriter();
			String strJson=JsonKit.toJSON(dr);
			pw.write(strJson);
			pw.flush();
			pw.close();
		}
	}
		
	/**
	 * 执行注销登出操作
	 * 
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/toLogin.do";
	}
	
	/**
	 * 回显DWZ配置片段
	 * 
	 * @param response
	 */
	@RequestMapping("/loadDwzFrags")
	public void loadDwzFrags(HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/xml;charset=UTF-8");
		Resource res =new ClassPathResource("dwz.frag.xml");
		try {
			IOUtils.copy(res.getInputStream(), response.getOutputStream());
		} catch (IOException e) {
			throw new RuntimeException("读取dwz配置文件失败！", e);
		}
	}
}
