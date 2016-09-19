package com.pc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pc.util.WanjinConst;
/**
 * 
 */
public class WanjinMobileLoginHandlerInterceptor extends HandlerInterceptorAdapter{
	protected Logger logger = Logger.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String path = request.getServletPath();
		Session session=SecurityUtils.getSubject().getSession();
		if(null != request.getParameter("INVITE_ME") && !"".equals(request.getParameter("INVITE_ME"))){
			session.setAttribute("inviteMe", request.getParameter("INVITE_ME"));
		}
		if(WanjinConst.SHARE.equals(path)||WanjinConst.RIGADD.equals(path)){
			if(null != request.getParameter("tn") && !"".equals(request.getParameter("tn"))){
				session.setAttribute("tn", request.getParameter("tn"));
			}
			String index=(String) session.getAttribute("index");
			if("1".equals(index)){
				session.removeAttribute("index");
				return true;
			}
			request.getRequestDispatcher(WanjinConst.DISTINGUISH).forward(request, response);
			return false;
		}else{		
			return true;
		}
	}
	 
	
}
