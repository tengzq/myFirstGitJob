package com.rcb.pc.authority.entity;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;





import com.rcb.pc.frame.annoaction.UseIDPatch;
import com.rcb.pc.frame.base.BaseEntity;


@UseIDPatch
@Entity
@Table(name="dwz_user")
public class User extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int userId;
	
	private String name;
	
	private String password;
	
	
	
	private Set<Role> roles;		//关联角色
	
	private TreeSet<Menu> menus = new TreeSet<Menu>(new Comparator<Menu>() {
		@Override
		public int compare(Menu o1, Menu o2) {
			int ret =o1.getSort() - o2.getSort();
			return ret == 0 ? -1 : ret;
		};
	});
	
	private List<Function> functions = new ArrayList<Function>();
	
	
	@Id
	@Column(name="user_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	@Column(name="name",length=40, nullable=false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="password",length=32, nullable=false)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@ManyToMany(targetEntity=Role.class,fetch=FetchType.EAGER)
	@JoinTable(
		name="t_user_role", 
		joinColumns=@JoinColumn(name="user_id"), 
		inverseJoinColumns=@JoinColumn(name="role_id")
	)
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	@Transient
	public TreeSet<Menu> getMenus() {
		return menus;
	}
	public void setMenus(TreeSet<Menu> menus) {
		this.menus = menus;
	}
	@Transient
	public List<Function> getFunctions() {
		return functions;
	}
	public void setFunctions(List<Function> functions) {
		this.functions = functions;
	}
	

}
