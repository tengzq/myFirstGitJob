package com.rcb.pc.authority.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rcb.pc.authority.entity.Menu;
import com.rcb.pc.authority.entity.Role;
import com.rcb.pc.authority.entity.User;
import com.rcb.pc.frame.base.OrderCondition;
import com.rcb.pc.frame.base.Page;

@Service
public class RoleService {
	
	@Autowired
	SessionFactory sessionFactory;
	
	/**
	 * 查询角色
	 * 
	 * @author tzq
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public void selectRoleList(Page<Role> page,OrderCondition order,Role role,User user) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql=new StringBuffer();
		hql.append("select role from Role role where 1=1");
		//若角色不是开发人员则屏蔽显示
		if(StringUtils.isNotEmpty(user.getName()) && !(user.getUserId()==1)){
			hql.append(" and role.roleId!=1");
		}
		if(StringUtils.isNotEmpty(role.getRoleName())){
			hql.append(" and role.roleName like '%"+role.getRoleName()+'%'+"'");
		}
		hql.append(order.toSql());
		Query queryCount=session.createQuery(hql.toString());	
		page.setTotalRows(queryCount.list().size());
		Query query=session.createQuery(hql.toString());
		query.setMaxResults(page.getPageSize());
		query.setFirstResult((page.getPageIndex()-1)*page.getPageSize());
		List<Role> roleList=query.list();
		page.setRows(roleList);	
	}
	
	/**
	 * 添加角色
	 * 
	 * @author tzq
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public int doAdd(Role role){
		String hql = "select role from Role role where role.roleName = ?";		
		List<User> list = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, role.getRoleName()).list();
		if(list.size()>0){
			return 2;
		}else{
			sessionFactory.getCurrentSession().save(role);
		}
		return 1;
	}
	
	/**
	 * 删除角色
	 * 
	 * @author tzq
	 */
	@Transactional
	public boolean delete(Role role) {
		Role Role = (Role)sessionFactory.getCurrentSession().get(Role.class, role.getRoleId());
		sessionFactory.getCurrentSession().delete(Role);
		return true;
	}
	
	/**
	 * 修改角色跳转（根据id查询角色）
	 * 
	 * @author tzq
	 */
	@Transactional
	public Role toEdit(Role role) {
		Role Role = (Role) sessionFactory.getCurrentSession().get(Role.class,role.getRoleId());	
		return Role;
	}
	
	/**
	 * 修改角色
	 * 
	 * @author tzq
	 */
	@Transactional
	public boolean doEdit(Role role) {
		Role Role = (Role) sessionFactory.getCurrentSession().get(Role.class,role.getRoleId());	
		role.setMenu(Role.getMenu());
		sessionFactory.getCurrentSession().merge(role);
		return true;
	}
	
	/**
	 * 查询所有角色
	 * 
	 * @author tzq
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Role> selectRoleAll() {
		String hql = "select role from Role role ";		
		List<Role> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	
	/**
	 * 
	 * 根据角色ID查询角色
	 * 
	 * @author tzq
	 * 
	 */
	@Transactional
	public Role selectRoleById(Role role){
		String hql="from Role  r left join fetch r.menu where r.roleId=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql).setParameter(0,role.getRoleId());
		Role Role= (Role) query.uniqueResult();
		//Role Role=sessionFactory.getCurrentSession().get(Role.class, id)
		return Role;
	}
	
	/**
	 * 
	 * 分配权限
	 * 
	 * @author tzq
	 * 
	 */
	@Transactional
	public boolean doPermissions(Role role,String[] menuIds){
		Role Role = (Role)sessionFactory.getCurrentSession().get(Role.class,role.getRoleId());
		Set<Menu> menu = new HashSet<Menu>();
		Role.setMenu(menu);
		sessionFactory.getCurrentSession().update(Role);
		for(int i = 0;i<menuIds.length;i++){
			Menu menus = new Menu();
			menus.setMenuId(Integer.parseInt(menuIds[i]));
			Role.getMenu().add(menus);
		}
		sessionFactory.getCurrentSession().update(Role);
		return true;
	}	
}
