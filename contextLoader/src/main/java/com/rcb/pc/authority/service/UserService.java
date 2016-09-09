package com.rcb.pc.authority.service;

import java.io.IOException;
import java.util.Date;
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

import com.rcb.pc.authority.entity.Role;
import com.rcb.pc.authority.entity.User;
import com.rcb.pc.frame.base.OrderCondition;
import com.rcb.pc.frame.base.Page;

/**
 * 用户管理
 * 
 * @author tzq
 *
 */
@Service
public class UserService {
	
	@Autowired
	private SessionFactory sessionFactory;;
	
	/**
	 * 查询用户
	 * 
	 * @author tzq
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public void selectUserList(Page<User> page,OrderCondition order,User user,Integer userId) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql=new StringBuffer();
		hql.append("select user from User user where 1 = 1");
		if(StringUtils.isNotEmpty(user.getName())){
			hql.append(" and user.userName like '%"+user.getName()+'%'+"'");
		}
	
		//若不是开发人员隐藏开发人员用户
		if(userId!=1){
			hql.append(" and user.userId!=1");
		}
		hql.append(order.toSql());
		Query queryCount=session.createQuery(hql.toString());	
		page.setTotalRows(queryCount.list().size());
		Query query=session.createQuery(hql.toString());
		query.setMaxResults(page.getPageSize());
		query.setFirstResult((page.getPageIndex()-1)*page.getPageSize());
		List<User> userList=query.list();
		page.setRows(userList);	
	}
	
	/**
	 * 用户添加
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public int userAdd(User user) {
		String hql = "select user from User user where user.userName = ?";		
		List<User> list = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, user.getName()).list();
		if(list.size()>0){
			return 2;
		}else{
			sessionFactory.getCurrentSession().save(user);
		}
		return 1;
	}
	
	/**
	 * 用户删除
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@Transactional
	public boolean delete(User user) {
		User User = (User) sessionFactory.getCurrentSession().get(User.class, user.getUserId());
		sessionFactory.getCurrentSession().delete(User);
		return true;
	}
	
	/**
	 * 用户修改跳转
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@Transactional
	public User toEdit(User user) {
		User User = (User) sessionFactory.getCurrentSession().get(User.class,user.getUserId());	
		return User;
	}
	
	/**
	 * 用户修改
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@Transactional
	public boolean doEdit(User user) {
		User User = (User) sessionFactory.getCurrentSession().get(User.class,user.getUserId());	
		user.setRoles(User.getRoles());
		sessionFactory.getCurrentSession().merge(user);
		return true;
	}
	
	/**
	 * 通过id查询用户
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@Transactional
	public User selectById(User user) {
		User User = (User) sessionFactory.getCurrentSession().get(User.class,user.getUserId());	
		return User;
	}
	
	/**
	 * 
	 * 角色添加
	 * 
	 * @author tzq
	 */
	@Transactional
	public boolean doRoleAdd(User user,String[] roleid){
		if(roleid.length!=0&&!(roleid[0].equals(""))){
			User User = (User) sessionFactory.getCurrentSession().get(User.class,user.getUserId());	
			Set<Role> role = new HashSet<Role>();
			User.setRoles(role);
			sessionFactory.getCurrentSession().update(User);
			for(int i = 0;i<roleid.length;i++){
				Role roles = new Role();
				roles.setRoleId(Integer.parseInt(roleid[i]));
				User.getRoles().add(roles);
			}
			sessionFactory.getCurrentSession().update(User);
		}
		return true;
	}
	
	/**
	 * 重置密码
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@Transactional
	public boolean doResPwd(User user,String newPwd) {
		User User = (User) sessionFactory.getCurrentSession().get(User.class,user.getUserId());	
		User.setPassword(newPwd);
		sessionFactory.getCurrentSession().merge(User);
		return true;
	}
	
	/**
	 * 个人信息修改
	 * 
	 * @author tzq
	 * @throws IOException 
	 */
	@Transactional
	public boolean doPersonalEdit(User user) {
		User User = (User) sessionFactory.getCurrentSession().get(User.class,user.getUserId());	
		user.setPassword(User.getPassword());
		user.setRoles(User.getRoles());
		sessionFactory.getCurrentSession().merge(user);
		return true;
	}
	
	
}
