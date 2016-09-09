package com.rcb.pc.authority;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rcb.pc.authority.entity.Role;
import com.rcb.pc.authority.entity.User;
import com.rcb.pc.authority.service.RoleService;
import com.rcb.pc.authority.service.UserService;
import com.rcb.pc.frame.AppConstant;
import com.rcb.pc.frame.annoaction.OperationLog;
import com.rcb.pc.frame.base.DwzResponse;
import com.rcb.pc.frame.base.Md5;
import com.rcb.pc.frame.base.OrderCondition;
import com.rcb.pc.frame.base.Page;
import com.rcb.pc.frame.kit.JsonKit;

/**
 * 用户管理
 * 
 * @author tzq
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	
	/**
	 * 查询用户
	 * 
	 * @author tzq
	 */
	@RequestMapping("/list")
	@OperationLog(value="查询用户")
	public String userList(User user,HttpServletRequest request,HttpServletResponse response) {
		
		Page<User> page=new Page<User>();
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
		userService.selectUserList(page,order,user,AppConstant.getUser(request).getUserId());
		request.setAttribute("user", user);
		request.setAttribute("page",page);
		return "user/list";
		
	}
	
	/**
	 * 用户添加跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toAdd")
	public String toAdd() {
		
		return "user/add";
	}
	
	/**
	 * 用户添加
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doAdd")
	@OperationLog(value="添加用户")
	public void doAdd(HttpServletRequest request,HttpServletResponse response,User user) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		user.setPassword(Md5.getMD5(user.getPassword()));
		int flag = userService.userAdd(user);
		if(flag==2){
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("用户名重复!");
		}else if(flag==0){
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作失败!");
		}else{
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作成功!");
		}
		PrintWriter pw=response.getWriter();
		String strJson=JsonKit.toJSON(dwzResponse);
		pw.write(strJson);
		pw.flush();
		pw.close();
	}
	
	/**
	 * 用户删除
	 * 
	 * @author tzq
	 * @throws IOException 
	 * 
	 */
	@RequestMapping("/delete")
	@OperationLog(value="删除用户")
	public void delete(HttpServletRequest request,HttpServletResponse response,User user) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		if(userService.delete(user)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_FORWARD);
			dwzResponse.setForwardUrl("user/list.do");
			dwzResponse.setMessage("操作成功!");
		}else{
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作失败!");
		}
		PrintWriter pw=response.getWriter();
		String strJson=JsonKit.toJSON(dwzResponse);
		pw.write(strJson);
		pw.flush();
		pw.close();
	}
	
	/**
	 * 
	 * 用户修改跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toEdit")
	public String toEdit(HttpServletRequest request,HttpServletResponse response,User user) {
		User User = userService.toEdit(user);
		request.setAttribute("user", User);
		return "user/edit";
	}
	
	/**
	 * 用户修改
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doEdit")
	@ResponseBody
	@OperationLog(value="修改用户")
	public DwzResponse doEdit(HttpServletRequest request,HttpServletResponse response,User user) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		String bz = request.getParameter("bz");
		String srcpwd =request.getParameter("passWord1");
		//没改密码
		if(bz.equals("false")){
			user.setPassword(srcpwd);
		} else {
			user.setPassword(Md5.getMD5(user.getPassword()));
		}
		if(userService.doEdit(user)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作成功!");
		}else{
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作失败!");
		}
		return dwzResponse;
	}
	
	/**
	 * 添加角色跳转
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/roleAdd")
	public String roleAdd(HttpServletRequest request,HttpServletResponse response,User user) throws IOException {
		List<Role> roleall = roleService.selectRoleAll();
		//已分配角色
		Set<Role> roleyet = userService.selectById(user).getRoles();
		request.setAttribute("userId", user.getUserId());
		request.setAttribute("roleall",roleall);
		request.setAttribute("roleyet",roleyet);
		return "user/roleAdd";
	}
	
	/**
	 * 添加角色
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doRoleAdd")
	@OperationLog(value="添加角色")
	public void doRoleAdd(HttpServletRequest request,HttpServletResponse response,User user) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		String[] roleids = request.getParameterValues("roleIds");
		if(userService.doRoleAdd(user,roleids)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作成功!");
		}else{
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作失败!");
		}
		PrintWriter pw=response.getWriter();
		String strJson=JsonKit.toJSON(dwzResponse);
		pw.write(strJson);
		pw.flush();
		pw.close();
		
	}
	
	/**
	 * 重置密码
	 * 
	 * @author tzq
	 * 
	 */
	@RequestMapping("/resPassWord")
	public String resPwd(HttpServletRequest request,HttpServletResponse response) throws IOException {
		return "user/respwd";
	}
	
	/**
	 * 重置密码
	 * 
	 * @author tzq
	 * @throws IOException 
	 * 
	 */
	@RequestMapping("/doResPwd")
	@OperationLog(value="重置密码")
	public void doResPwd(HttpServletRequest request,HttpServletResponse response) throws IOException{
		DwzResponse dwzResponse=new DwzResponse();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_SESSION_KEY");
		User User = userService.selectById(user);
		String oldPwd = Md5.getMD5(request.getParameter("oldPassWord"));
		if(!(oldPwd.equals(User.getPassword()))){
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("原密码不正确!");
		}else{
			String newPwd = Md5.getMD5(request.getParameter("newPassWord"));
			if(userService.doResPwd(user,newPwd)){
				dwzResponse.setStatusCode(DwzResponse.SC_OK);
				dwzResponse.setCallbackType(DwzResponse.CT_FORWARD);
				dwzResponse.setForwardUrl("user/resPassWord.do");
				dwzResponse.setMessage("操作成功!");
			}else{
				dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
				dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
				dwzResponse.setMessage("操作失败!");
			}
		}
		PrintWriter pw=response.getWriter();
		String strJson=JsonKit.toJSON(dwzResponse);
		pw.write(strJson);
		pw.flush();
		pw.close();
	}
	
	/**
	 * 
	 * 个人信息修改跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toPersonalEdit")
	public String toPersonalEdit(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_SESSION_KEY");
		User User = userService.selectById(user);
		request.setAttribute("user", User);
		return "user/personalEdit";
	}
	
	/**
	 * 个人信息修改
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doPersonalEdit")
	@OperationLog(value="个人信息修改")
	public void doPersonalEdit(HttpServletRequest request,HttpServletResponse response,User user) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		if(userService.doPersonalEdit(user)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_FORWARD);
			dwzResponse.setForwardUrl("user/toPersonalEdit.do");
			dwzResponse.setMessage("操作成功!");
		}else{
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作失败!");
		}
		PrintWriter pw=response.getWriter();
		String strJson=JsonKit.toJSON(dwzResponse);
		pw.write(strJson);
		pw.flush();
		pw.close();
	}
	
	
	
	

}
