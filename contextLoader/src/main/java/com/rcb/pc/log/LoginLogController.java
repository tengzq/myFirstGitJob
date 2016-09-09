package com.rcb.pc.log;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rcb.pc.frame.base.DwzResponse;
import com.rcb.pc.frame.base.OrderCondition;
import com.rcb.pc.frame.base.Page;
import com.rcb.pc.frame.base.PrintWriterUtil;
import com.rcb.pc.frame.kit.DateUtil;
import com.rcb.pc.log.entity.LoginLogEntity;
import com.rcb.pc.log.service.LoginLogService;

/**
 * 登陆日志
 * 
 * @author sunlong
 *
 */
@Controller
@RequestMapping("/log")
public class LoginLogController {
	
	@Autowired
	private LoginLogService logService;
	
	/**
	 * 查询日志
	 * 
	 * @author sunlong
	 * @throws ParseException 
	 */
	@RequestMapping("/logList")
	public String loginLogList(LoginLogEntity log,HttpServletRequest request,HttpServletResponse response) throws ParseException {
		String loginDateStart = request.getParameter("loginDateStart");
		String loginDateEnd = request.getParameter("loginDateEnd");
		if(StringUtils.isNotEmpty(loginDateStart) && StringUtils.isNotEmpty(loginDateEnd)){
	    	if(!DateUtil.compareTwoDate(loginDateStart,loginDateEnd,DateUtil.DATETIMEFORMAR)){
	    		DwzResponse dwzResponse=new DwzResponse();
	    		dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
	    		dwzResponse.setMessage("登陆日期开始时间不能大于结束时间!");
	    		dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
	    		PrintWriterUtil.writeObject(response, dwzResponse);
	    	}
	    }
		String logoutDateStart = request.getParameter("logoutDateStart");
		String logoutDateEnd = request.getParameter("logoutDateEnd");
		if(StringUtils.isNotEmpty(logoutDateStart) && StringUtils.isNotEmpty(logoutDateEnd)){
	    	if(!DateUtil.compareTwoDate(logoutDateStart,logoutDateEnd,DateUtil.DATETIMEFORMAR)){
	    		DwzResponse dwzResponse=new DwzResponse();
	    		dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
	    		dwzResponse.setMessage("登出日期开始时间不能大于结束时间!");
	    		dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
	    		PrintWriterUtil.writeObject(response, dwzResponse);
	    	}
	    }
		Page<LoginLogEntity> page=new Page<LoginLogEntity>();
		String pageIndex=request.getParameter("pageNum");
		if(StringUtils.isEmpty(pageIndex)){
			page.setPageIndex(1);
		}else{
			page.setPageIndex(Integer.parseInt(pageIndex));
		}
		String pageSize=request.getParameter("numPerPage");
		if(StringUtils.isEmpty(pageSize)){
			page.setPageSize(20);
		}else{
			page.setPageSize(Integer.parseInt(pageSize));
		}
		String filed=request.getParameter("orderField");
		String direction=request.getParameter("orderDirection");
		if(StringUtils.isEmpty(direction)){
			direction="asc";
		}
		OrderCondition order=new OrderCondition(filed,direction);
		request.setAttribute("order",order);
		logService.selectLogList(page,order,log,loginDateStart,loginDateEnd,logoutDateStart,logoutDateEnd);
		request.setAttribute("log", log);
		request.setAttribute("loginDateStart", loginDateStart);
		request.setAttribute("loginDateEnd", loginDateEnd);
		request.setAttribute("logoutDateStart", logoutDateStart);
		request.setAttribute("logoutDateEnd", logoutDateEnd);
		request.setAttribute("page",page);
		return "log/loginLogList";
		
	}
}
