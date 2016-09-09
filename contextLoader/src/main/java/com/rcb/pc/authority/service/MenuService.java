package com.rcb.pc.authority.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rcb.pc.authority.entity.Function;
import com.rcb.pc.authority.entity.Menu;
import com.rcb.pc.authority.entity.Role;
import com.rcb.pc.authority.entity.User;
import com.rcb.pc.frame.base.OrderCondition;
import com.rcb.pc.frame.base.Page;

@Service
public class MenuService {
	
	@Autowired
	SessionFactory sessionFactory;
	
	JdbcTemplate jdbc;
	
	/**************************************主菜单begin***********************************************/
	/**
	 * 查询菜单
	 * 
	 * @author tzq
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public void selectPrimaryList(Page<Menu> page,OrderCondition order,Menu menu) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql=new StringBuffer();
		hql.append("select menu from Menu menu where menu.parentId=0 ");
		if(StringUtils.isNotEmpty(menu.getMenuName())){
			hql.append("and menu.menuName like '%"+menu.getMenuName()+'%'+"'");
		}
		hql.append(order.toSql());
		Query queryCount=session.createQuery(hql.toString());	
		page.setTotalRows(queryCount.list().size());
		Query query=session.createQuery(hql.toString());
		query.setMaxResults(page.getPageSize());
		query.setFirstResult((page.getPageIndex()-1)*page.getPageSize());
		List<Menu> menuList=query.list();
		page.setRows(menuList);	
	}
	
	/**
	 * 主菜单添加跳转（查询最大排序值）
	 * @author tzq
	 * return sort
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public int toPrimaryAdd(int parentId){
		String hql = "select max(menu.sort) from Menu menu where menu.parentId = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, parentId);
		int sort = 0;
		List<Object> list = query.list();
		if(!(list.get(0)==null)){
			sort = Integer.parseInt(query.list().get(0).toString());
		}
		return sort+1;
	}
	
	/**
	 * 添加菜单
	 * 
	 * @author tzq
	 */
	@Transactional
	public boolean doPrimaryAdd(Menu menu){
		sessionFactory.getCurrentSession().save(menu);
		return true;
	}
	
	/**
	 * 删除主菜单
	 * 
	 * @author tzq
	 */
	@Transactional
	public boolean deletePrimary(Menu menu) {
		
		//删除主菜单及下面的子菜单
		String hql = "delete from Menu menu where menu.menuId = ? or menu.parentId = ?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, menu.getMenuId());
		query.setParameter(1, menu.getMenuId());
		query.executeUpdate();
		return true;
	}
	
	/**
	 * 修改菜单跳转（根据id查询菜单）
	 * 
	 * @author tzq
	 */
	@Transactional
	public Menu toEdit(Menu menu) {
		Menu Menu = (Menu) sessionFactory.getCurrentSession().get(Menu.class,menu.getMenuId());	
		return Menu;
	}
	
	/**
	 * 修改菜单
	 * 
	 * @author tzq
	 */
	@Transactional
	public boolean doPrimaryEdit(Menu menu) {
		sessionFactory.getCurrentSession().update(menu);
		return true;
	}
	
	/**************************************主菜单end***********************************************/
	
	/**************************************子菜单begin***********************************************/
	
	/**
	 * 查询子菜单
	 * 
	 * @author tzq
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public void selectChildList(String menuId,Page<Menu> page,OrderCondition order,String menuName) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql=new StringBuffer();
		hql.append("select menu from Menu menu where menu.parentId='"+menuId+"'");
		if(!(menuName==null||menuName.equals(""))){
			hql.append(" and menu.menuName like '%"+menuName+'%'+"'");
		}
		hql.append(order.toSql());
		Query queryCount=session.createQuery(hql.toString());	
		page.setTotalRows(queryCount.list().size());
		Query query=session.createQuery(hql.toString());
		query.setMaxResults(page.getPageSize());
		query.setFirstResult((page.getPageIndex()-1)*page.getPageSize());
		List<Menu> menuList=query.list();
		page.setRows(menuList);	
	}
	
	/**
	 * 删除子菜单
	 * 
	 * @author tzq
	 */
	@Transactional
	public boolean deleteChild(Menu menu) {
		Menu Menu = (Menu) sessionFactory.getCurrentSession().get(Menu.class, menu.getMenuId());
		sessionFactory.getCurrentSession().delete(Menu);
		return true;
	}
	
	/**************************************子菜单end***********************************************/
	
	/**************************************子菜单功能begin***********************************************/
	
	/**
	 * 查询功能
	 * 
	 * @author tzq
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public void selectFunctionList(String menuId,Page<Function> page,OrderCondition order,Function function) {
		//获取session 
		Session session=sessionFactory.getCurrentSession();
		//hql语句
		StringBuffer hql=new StringBuffer();
		//获取个数
		hql.append("select function from Function function where function.menu.menuId='"+menuId+"'");
		if(StringUtils.isNotEmpty(function.getFunctionName())){
			hql.append(" and function.functionName like '%"+function.getFunctionName()+'%'+"'");
		}
		hql.append(order.toSql());
		Query queryCount=session.createQuery(hql.toString());	
		page.setTotalRows(queryCount.list().size());
		Query query=session.createQuery(hql.toString());
		query.setMaxResults(page.getPageSize());
		query.setFirstResult((page.getPageIndex()-1)*page.getPageSize());
		List<Function> functionList=query.list();
		page.setRows(functionList);	
	}
	
	/**
	 * 添加功能
	 * 
	 * @author tzq
	 */
	@Transactional
	public int doAddFunction(Function function,int menuId){
		Menu Menu = (Menu) sessionFactory.getCurrentSession().get(Menu.class,menuId);
		function.setMenu(Menu);
		sessionFactory.getCurrentSession().save(function);
		return 1;
	}
	
	/**
	 * 删除功能
	 * 
	 * @author tzq
	 */
	@Transactional
	public boolean deleteFunction(Function function) {
		Function Function = (Function)sessionFactory.getCurrentSession().get(Function.class, function.getFunctionId());
		sessionFactory.getCurrentSession().delete(Function);
		return true;
	}
	
	/**
	 * 修改功能跳转（根据id查询功能）
	 * 
	 * @author tzq
	 */
	@Transactional
	public Function toFunctionEdit(Function function) {
		Function Function = (Function) sessionFactory.getCurrentSession().get(Function.class,function.getFunctionId());	
		return Function;
	}
	
	/**
	 * 修改功能
	 * 
	 * @author tzq
	 */
	@Transactional
	public boolean doEditFunction(Function function,String menuId) {
		Menu Menu = (Menu) sessionFactory.getCurrentSession().get(Menu.class,Integer.parseInt(menuId));
		function.setMenu(Menu);
		sessionFactory.getCurrentSession().saveOrUpdate(function);
		return true;
	}
	
	/**************************************子菜单功能end***********************************************/
	
	/****************************************公共模块功能引用begin*********************************************/
	
	/**
	 * 
	 * 查询菜单
	 * 
	 * @author tzq
	 */
	/*@SuppressWarnings("unchecked")
	@Transactional
	public List<Menu> selectMainMenu(User user,String menuId){
		String hql = "select menu from Menu menu left join fetch menu.role r where r.roleId in(";
		if(user!=null && user.getRoles()!=null){
			for(Role r:user.getRoles()){
				hql+=r.getRoleId()+",";
			}
			hql+="0)";
		}
		if(StringUtils.isNotEmpty(menuId)){
			hql+=" and menu.parentId="+menuId;
		}
		
		List<Menu> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}*/
	
	@Transactional
	public List<Menu> selectMainMenu( String menuId) {
		//StringBuffer sb = new StringBuffer();
		String hql =  "select menu from Menu menu where menu.parentId=0";
		List<Menu> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
		
	@Transactional
	public List<Menu> selectChildMenu (String menuId) {
		String hql ="select menu from Menu menu where menu.parentId="+menuId;
		List<Menu> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	
	
	}
	
	
	/**
	 * 
	 * 查询子菜单
	 * 
	 * @author tzq
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Menu> selectChildMenu(int menuId){
		String hql = "select menu from Menu menu where menu.parentId = ?";		
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, menuId);
		List<Menu> list = query.list();
		return list;
	}
	
	/****************************************公共模块功能引用end*********************************************/
}
