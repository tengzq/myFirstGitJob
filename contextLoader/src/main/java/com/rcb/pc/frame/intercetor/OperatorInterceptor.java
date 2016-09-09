package com.rcb.pc.frame.intercetor;

import java.lang.reflect.Method;
import java.net.InetAddress;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.rcb.pc.log.service.OperationLogService;

@Component
public class OperatorInterceptor extends HandlerInterceptorAdapter {

	private Log log =LogFactory.getLog("[功能日志过滤器]");
	
	@Autowired
	private OperationLogService operationLogService;
	
	/*@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//获取访问的方法
		if(handler instanceof HandlerMethod){
			HandlerMethod method = (HandlerMethod) handler;
			//获取访问的controller
			Object controller=method.getBean();
			Method currentMethod=method.getMethod();
			//设置访问权限
			currentMethod.setAccessible(true);
			log.info("正在访问"+controller.getClass().getSimpleName()+"中的"+currentMethod.getName()+"()");
			UserEntity user=AppConstant.getUserEntity(request);
			if(user!=null){
				System.out.println(operationLogService);
				log.info("拦截到了"+currentMethod.getName()+"()");
				log.info("用户名:"+AppConstant.getUserEntity(request).getUserName());
				if(currentMethod.isAnnotationPresent(OperationLog.class)){
					//调用日志
					OperationLog annoLog =currentMethod.getAnnotation(OperationLog.class);
					String url=request.getRequestURI();
					OperationLogEntity oprLog=new OperationLogEntity();
					oprLog.setOptActionName(annoLog.value());
					oprLog.setOptComment("");
					oprLog.setOptUserName(user.getUserName());
					oprLog.setOptUserId(user.getUserId());
					oprLog.setOptIp(InetAddress.getLocalHost().getHostAddress()); 
					oprLog.setOptUrl(request.getRequestURI());
					oprLog.setOptTime(new Timestamp(new Date().getTime()));
					oprLog.setOptResult("操作成功!");
					oprLog.setOptComment("");
					//初次插入默认0
					oprLog.setOptStatus("0");
					oprLog.setOptRealName(user.getRealName());
					boolean flag=operationLogService.addOperationLog(oprLog);
					if(flag){
						request.setAttribute(AppConstant.REQUEST_OPR_LOG_ID,oprLog.getOptId());
						log.info("操作日志录入成功!"+annoLog.value()+":url:"+url);
					}else{
						log.info("操作日志录入失败!");
					}
				}
			}else{
				log.info("未登录不记录日志!");
			}
		}
		return true;
	}*/
}
