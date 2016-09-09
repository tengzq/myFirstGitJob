package com.rcb.pc.authority.entity;

import java.util.Set;

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




import com.rcb.pc.frame.annoaction.UseIDPatch;
import com.rcb.pc.frame.base.BaseEntity;


@UseIDPatch
@Entity
@Table(name="dwz_role")
public class Role extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int roleId;						//角色ID
	
	private String roleName;				//角色名称
	
	private String descriptions;			//角色描述
	
	private Set<User> users;			//关联用户
	
	private Set<Menu> menu;			//关联菜单

	
	@Id
	@Column(name="role_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	@Column(name="role_name", length=40, nullable=false)
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	@Column(length=200)
	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}
	@ManyToMany(targetEntity=User.class,mappedBy="roles",fetch=FetchType.LAZY)
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@ManyToMany(targetEntity=Menu.class,fetch=FetchType.LAZY)
	@JoinTable(
			name="t_role_menu", 
			joinColumns=@JoinColumn(name="role_id"), 
			inverseJoinColumns=@JoinColumn(name="menu_id")
		)
	public Set<Menu> getMenu() {
		return menu;
	}

	public void setMenu(Set<Menu> menu) {
		this.menu = menu;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
