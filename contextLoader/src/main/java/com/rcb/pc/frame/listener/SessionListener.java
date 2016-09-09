package com.rcb.pc.frame.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.rcb.pc.log.service.LoginLogService;

/**
 * session销毁监听类
 * 
 * @author SunLong
 *
 */
@WebListener
public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(se.getSession().getServletContext());
		LoginLogService logService = ctx.getBean(LoginLogService.class);
		String sessionId = se.getSession().getId();
		logService.logout(sessionId);
	}
}
