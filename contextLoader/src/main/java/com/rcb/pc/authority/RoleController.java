package com.rcb.pc.authority;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rcb.pc.authority.entity.Menu;
import com.rcb.pc.authority.entity.Role;
import com.rcb.pc.authority.entity.User;
import com.rcb.pc.authority.service.MenuService;
import com.rcb.pc.authority.service.RoleService;
import com.rcb.pc.frame.AppConstant;
import com.rcb.pc.frame.annoaction.OperationLog;
import com.rcb.pc.frame.base.DwzResponse;
import com.rcb.pc.frame.base.OrderCondition;
import com.rcb.pc.frame.base.Page;
import com.rcb.pc.frame.kit.Assert;
import com.rcb.pc.frame.kit.JsonKit;

/**
 * 角色管理
 * 
 * @author tzq
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private MenuService menuService;
	
	/**
	 * 查询角色
	 * 
	 * @author tzq
	 */
	@RequestMapping("/list")
	@OperationLog(value="查询角色")
	public String RoleList(Role role,HttpServletRequest request,HttpServletResponse response) {
		Page<Role> page=new Page<Role>();
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
		roleService.selectRoleList(page,order,role,AppConstant.getUser(request));
		request.setAttribute("role", role);
		request.setAttribute("page",page);
		return "role/list";
	}
	
	/**
	 * 角色添加跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toAdd")
	public String toAdd() {
		
		return "role/add";
	}
	
	/**
	 * 角色添加
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doAdd")
	@OperationLog(value="添加角色")
	public void doAdd(HttpServletRequest request,HttpServletResponse response,Role Role) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		int flag = roleService.doAdd(Role);
		if(flag==2){
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("角色名重复!");
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
	 * 角色删除
	 * 
	 * @author tzq
	 * @throws IOException 
	 * 
	 */
	@RequestMapping("/delete")
	@OperationLog(value="删除角色")
	public void delete(HttpServletRequest request,HttpServletResponse response,Role role) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		if(roleService.delete(role)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_FORWARD);
			dwzResponse.setForwardUrl("role/list.do");
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
	 * 角色修改跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toEdit")
	public String toEdit(HttpServletRequest request,HttpServletResponse response,Role role) {
		Role roles = roleService.toEdit(role);
		request.setAttribute("role", roles);
		return "role/edit";
	}
	
	/**
	 * 角色修改
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doEdit")
	@OperationLog(value="修改角色")
	public void doEdit(HttpServletRequest request,HttpServletResponse response,Role role) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		if(roleService.doEdit(role)){
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
	 * 分配权限之前加载数据
	 * @return
	 */
	@RequestMapping("/toAddPermission")
	public String toAermtoAddPermissionissions(HttpServletRequest request,HttpServletResponse response,Role role){
		//所有菜单及功能
		User user = AppConstant.getUser(request);
	
		
		List<Menu> menuList = menuService.selectMainMenu("0");
		//用于去除重复选项
		TreeSet<Menu> menuSet=new TreeSet<Menu>();
		menuSet.addAll(menuList);
		menuList.clear();
		menuList.addAll(menuSet);
		
		for(Menu menu:menuList){
			menuSet=new TreeSet<Menu>();
			List<Menu> childMenuEntities=menuService.selectChildMenu(String.valueOf(menu.getMenuId()));
			
			menuSet.addAll(childMenuEntities);
			childMenuEntities.clear();
			childMenuEntities.addAll(menuSet);
			menu.setChildList(childMenuEntities);
		}
		
		
		//已分配的菜单和功能
		Role roleYet = roleService.selectRoleById(role);
		Set<Menu> menuYet = roleYet.getMenu();
		Assert.notNull(menuYet);
		
		request.setAttribute("roleId", role.getRoleId());
		request.setAttribute("menuYet", menuYet);
		request.setAttribute("menuList", menuList);
		return "role/permissionAdd";
	}
	
	/**
	 * 
	 * 分配权限
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doPermissions")
	@OperationLog(value="角色分配权限")
	public void doPermissions(HttpServletRequest request,HttpServletResponse response,Role role) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		String[] menuIds = request.getParameterValues("menuId");
		if(roleService.doPermissions(role,menuIds)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作成功！");
		}else{
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setMessage("操作失败！");
		}
		PrintWriter pw=response.getWriter();
		String strJson=JsonKit.toJSON(dwzResponse);
		pw.write(strJson);
		pw.flush();
		pw.close();
	}
}

