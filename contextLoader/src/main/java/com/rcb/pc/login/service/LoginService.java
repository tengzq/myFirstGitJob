package com.rcb.pc.login.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rcb.pc.authority.entity.Function;
import com.rcb.pc.authority.entity.Menu;
import com.rcb.pc.authority.entity.Role;
import com.rcb.pc.authority.entity.User;

@Service
public class LoginService{
	
	@Autowired
	SessionFactory sessionFactory;
	/**
	 * 登陆
	 * 
	 * @author tzq
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String,Object> login(User user) {
		Map<String,Object> userMap = new HashMap<String, Object>();
		System.out.println(user.getName());
		String hql = "from User user left join fetch user.roles "
				+ " as role left join fetch role.menu as menu "
				+ " left join fetch menu.function where user.name = " +"'"+ user.getName()+"'";
		System.out.println(hql);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		//query.setParameter(0, user.getName());
		List<User> list = query.list();
		User Users = new User();
		List<Menu> menuList = new ArrayList<Menu>();
		if(!(list.isEmpty())){
			Users = list.get(0);
			if(Users.getPassword().equals(user.getPassword())){
				for(Role roles : Users.getRoles()){
					for(Menu menu : roles.getMenu()){
						menuList.add(menu);
						for(Function function : menu.getFunction()){
							Users.getFunctions().add(function);
						}
					}
				}
				Set<Menu> temp =new HashSet<Menu>();
				temp.addAll(menuList);
				Users.getMenus().addAll(temp);
				userMap.put("user", Users);
				return userMap;
			}else {
				// 如果密码不匹配
				userMap.put("user", Users);
				userMap.put("state", "pwdNull");
				return userMap;
			}
		}else {
			user.setName("");
			userMap.put("user", user);
			return userMap;
		}
	}
	
}
