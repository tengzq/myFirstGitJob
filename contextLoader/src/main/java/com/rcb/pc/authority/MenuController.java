package com.rcb.pc.authority;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rcb.pc.authority.entity.Function;
import com.rcb.pc.authority.entity.Menu;
import com.rcb.pc.authority.service.MenuService;
import com.rcb.pc.frame.annoaction.OperationLog;
import com.rcb.pc.frame.base.DwzResponse;
import com.rcb.pc.frame.base.OrderCondition;
import com.rcb.pc.frame.base.Page;
import com.rcb.pc.frame.kit.JsonKit;

/**
 * 菜单管理
 * 
 * @author tzq
 *
 */
@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	/**************************************主菜单begin***********************************************/
	/**
	 * 主查询菜单
	 * 
	 * @author tzq
	 */
	@RequestMapping("/primaryList")
	@OperationLog(value="查询主菜单")
	public String primaryList(Menu menu,HttpServletRequest request,HttpServletResponse response) {
		Page<Menu> page=new Page<Menu>();
		//当前页
		String pageIndex=request.getParameter("pageNum");
		if(StringUtils.isEmpty(pageIndex)){
			page.setPageIndex(1);
		}else{
			page.setPageIndex(Integer.parseInt(pageIndex));
		}
		//当前页格式
		String pageSize=request.getParameter("numPerPage");
		if(StringUtils.isEmpty(pageSize)){
			page.setPageSize(20);
		}else{
			page.setPageSize(Integer.parseInt(pageSize));
		}
		//排序条件
		String filed=request.getParameter("orderField");
		//排序规则（升序或降序）
		String direction=request.getParameter("orderDirection");
		if(StringUtils.isEmpty(direction)){
			direction="asc";
		}
		//排序
		OrderCondition order=new OrderCondition(filed,direction);
		request.setAttribute("order",order);
		menuService.selectPrimaryList(page,order,menu);
		request.setAttribute("menu", menu);
		request.setAttribute("page",page);
		return "menu/primaryList";
	}
	
	/**
	 * 主菜单添加跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toPrimaryAdd")
	public String toPrimaryAdd(Menu menu,HttpServletRequest request,HttpServletResponse response) {
		int parentId = Integer.parseInt(request.getParameter("parentId"));
		int sort = menuService.toPrimaryAdd(parentId);
		request.setAttribute("parentId", parentId);
		request.setAttribute("sort", sort);
		return "menu/primaryAdd";
	}
	
	/**
	 * 主菜单添加
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doPrimaryAdd")
	@OperationLog(value="添加主菜单")
	public void doPrimaryAdd(HttpServletRequest request,HttpServletResponse response,Menu menu) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		String url = menu.getUrl();
		String changeUrl = url.substring(0,1);
		if(changeUrl != "/" && !"/".equals(changeUrl)){
			url = "/"+url;
			menu.setUrl(url);
		}
		menu.setRel("/");
		if(menuService.doPrimaryAdd(menu)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作成功!");
		}else{
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("添加失败!");
		}
		PrintWriter pw=response.getWriter();
		String strJson=JsonKit.toJSON(dwzResponse);
		pw.write(strJson);
		pw.flush();
		pw.close();
	}
	
	/**
	 * 主菜单删除
	 * 
	 * @author tzq
	 * @throws IOException 
	 * 
	 */
	@RequestMapping("/deletePrimary")
	@OperationLog(value="删除主菜单")
	public void deletePrimary(HttpServletRequest request,HttpServletResponse response,Menu menu) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		if(menuService.deletePrimary(menu)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_FORWARD);
			dwzResponse.setForwardUrl("menu/primaryList.do");
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
	 * 主菜单修改跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toPrimaryEdit")
	public String toPrimaryEdit(HttpServletRequest request,HttpServletResponse response,Menu menu) {
		Menu Menu = menuService.toEdit(menu);
		request.setAttribute("primaryMenu", Menu);
		return "menu/primaryEdit";
	}
	
	/**
	 * 主菜单修改
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doPrimaryEdit")
	@OperationLog(value="修改主菜单")
	public void doPrimaryEdit(HttpServletRequest request,HttpServletResponse response,Menu menu) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		if(menuService.doPrimaryEdit(menu)){
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
	
	/**************************************主菜单end***********************************************/
	
	/**************************************子菜单begin***********************************************/
	
	/**
	 * 查询子菜单
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toChildList")
	@OperationLog(value="查询子菜单")
	public String toChildList(HttpServletRequest request,HttpServletResponse response) {
		String menuName = "";
		menuName = request.getParameter("childMenuName");
		Page<Menu> page=new Page<Menu>();
		String menuId = request.getParameter("menuId");
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
		
		//排序条件
		String filed=request.getParameter("orderField");
		//排序规则（升序或降序）
		String direction=request.getParameter("orderDirection");
		if(StringUtils.isEmpty(direction)){
			direction="asc";
		}
		//排序
		OrderCondition order=new OrderCondition(filed,direction);
		request.setAttribute("order",order);
		menuService.selectChildList(menuId,page,order,menuName);
		request.setAttribute("page",page);
		request.setAttribute("menuName",menuName);
		request.setAttribute("returnMenuId",menuId);
		return "menu/childList";
	}
	
	/**
	 * 子菜单添加跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toChildAdd")
	public String toChildAdd(Menu menu,HttpServletRequest request,HttpServletResponse response) {
		int parentId = Integer.parseInt(request.getParameter("parentId"));
		int sort = menuService.toPrimaryAdd(parentId);
		request.setAttribute("parentId", parentId);
		request.setAttribute("sort", sort);
		return "menu/childAdd";
	}
	
	/**
	 * 子菜单添加
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doChildAdd")
	@OperationLog(value="添加子菜单")
	public void doChildAdd(HttpServletRequest request,HttpServletResponse response,Menu menu) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		String url = menu.getUrl();
		String changeUrl = url.substring(0,1);
		if(changeUrl != "/" && !"/".equals(changeUrl)){
			url = "/"+url;
			menu.setUrl(url);
		}
		if(menuService.doPrimaryAdd(menu)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("操作成功!");
		}else{
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("添加失败!");
		}
		PrintWriter pw=response.getWriter();
		String strJson=JsonKit.toJSON(dwzResponse);
		pw.write(strJson);
		pw.flush();
		pw.close();
	}
	
	/**
	 * 子菜单删除
	 * 
	 * @author tzq
	 * @throws IOException 
	 * 
	 */
	@RequestMapping("/deleteChild")
	@OperationLog(value="删除子菜单")
	public void deleteChild(HttpServletRequest request,HttpServletResponse response,Menu menu) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		if(menuService.deleteChild(menu)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_FORWARD);
			dwzResponse.setForwardUrl("menu/toChildList.do?menuId="+menu.getParentId());
			dwzResponse.setMessage("删除子菜单成功!");
		}else{
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_FORWARD);
			dwzResponse.setForwardUrl("menu/toChildList.do?menuId="+menu.getParentId());
			dwzResponse.setMessage("删除子菜单失败!");
		}
		PrintWriter pw=response.getWriter();
		String strJson=JsonKit.toJSON(dwzResponse);
		pw.write(strJson);
		pw.flush();
		pw.close();
	}
	
	/**
	 * 
	 * 子菜单修改跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toChildEdit")
	public String toChildEdit(HttpServletRequest request,HttpServletResponse response,Menu menu) {
		Menu Menu = menuService.toEdit(menu);
		request.setAttribute("childMenu", Menu);
		return "menu/childEdit";
	}
	
	

	
	
	/**
	 * 子菜单修改
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doChildEdit")
	@OperationLog(value="修改子菜单")
	public void doChildEdit(HttpServletRequest request,HttpServletResponse response,Menu menu) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		if(menuService.doPrimaryEdit(menu)){
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
	
	/**************************************子菜单end***********************************************/
	
	/**************************************功能begin***********************************************/
	/**
	 * 查询子菜单功能
	 * 
	 * @author tzq
	 */
	@RequestMapping("/functionList")
	@OperationLog(value="查询子菜单功能")
	public String functionList(HttpServletRequest request,HttpServletResponse response,Function function) {
		Page<Function> page=new Page<Function>();
		String menuId = request.getParameter("menuId");
		String parentId = request.getParameter("parentId");
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
		//排序规则（升序或降序）
		String direction=request.getParameter("orderDirection");
		if(StringUtils.isEmpty(direction)){
			direction="asc";
		}
		//排序
		OrderCondition order=new OrderCondition();
		request.setAttribute("order",order);
		menuService.selectFunctionList(menuId,page,order,function);
		request.setAttribute("page",page);
		request.setAttribute("menuId", menuId);
		request.setAttribute("returnChildMenu",parentId);
		request.setAttribute("function",function);
		return "menu/functionList";
	}
	
	/**
	 * 功能添加跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toFunctionAdd")
	public String toFunctionAdd(Function function,HttpServletRequest request,HttpServletResponse response) {
		String parentId = request.getParameter("parentId");
		request.setAttribute("menuId", request.getParameter("menuId"));
		request.setAttribute("parentId", parentId);
		return "menu/functionAdd";
	}
	
	/**
	 * 功能添加
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doAddFunction")
	@OperationLog(value="添加主菜单功能")
	public void doAddFunction(HttpServletRequest request,HttpServletResponse response,Function function) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		String url = function.getUrl();
		String changeUrl = url.substring(0,1);
		if(changeUrl != "/" && !"/".equals(changeUrl)){
			url = "/"+url;
			function.setUrl(url);
		}
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int flag = menuService.doAddFunction(function,menuId);
		if(flag==0){
			dwzResponse.setStatusCode(DwzResponse.SC_ERROR);
			dwzResponse.setCallbackType(DwzResponse.CT_CLOSE);
			dwzResponse.setMessage("添加失败!");
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
	 * 功能删除
	 * 
	 * @author tzq
	 * @throws IOException 
	 * 
	 */
	@RequestMapping("/deleteFunction")
	@OperationLog(value="删除子菜单功能")
	public void deleteFunction(HttpServletRequest request,HttpServletResponse response,Function function) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		String parentId = request.getParameter("parentId");
		if(menuService.deleteFunction(function)){
			dwzResponse.setStatusCode(DwzResponse.SC_OK);
			dwzResponse.setCallbackType(DwzResponse.CT_FORWARD);
			dwzResponse.setForwardUrl("menu/functionList.do?menuId="+request.getParameter("menuId")+"&parentId="+parentId);
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
	 * 功能修改跳转
	 * 
	 * @author tzq
	 */
	@RequestMapping("/toFunctionEdit")
	public String toFunctionEdit(HttpServletRequest request,HttpServletResponse response,Function function) {
		Function Function = menuService.toFunctionEdit(function);
		request.setAttribute("function", Function);
		return "menu/functionEdit";
	}
	
	/**
	 * 功能修改
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@RequestMapping("/doEditFunction")
	@OperationLog(value="修改子菜单功能")
	public void doEditFunction(HttpServletRequest request,HttpServletResponse response,Function function) throws IOException {
		DwzResponse dwzResponse=new DwzResponse();
		String menuId = request.getParameter("menuId");
		if(menuService.doEditFunction(function,menuId)){
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
	
	/**************************************功能end***********************************************/
}

