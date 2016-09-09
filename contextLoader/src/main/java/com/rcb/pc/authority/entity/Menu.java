package com.rcb.pc.authority.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;





import com.rcb.pc.frame.annoaction.UseIDPatch;
import com.rcb.pc.frame.base.BaseEntity;

@UseIDPatch
@Entity
@Table(name="dwz_menu")
public class Menu extends BaseEntity implements Comparable<Menu>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int menuId;						//菜单ID
	
	private String menuName;				//菜单名称
	
	private String url;						//url
	
	private String description;				//描述
	
	private int sort;						//排序
	private int parentId;					//父ID
	
	private String rel;						//rel
	
	private Set<Role> role =new HashSet<Role>();			//关联角色
	
	private Set<Function> function =new HashSet<Function>(); 	//关联功能
	
	private List<Menu> ChildList = new ArrayList<Menu>();		//子集菜单
	
	@Id
	@Column(name="menu_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	@Column(name="menu_name", length=40, nullable=false)
	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Column(name="url", length=50, nullable=false)
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(length=200)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name="sort",length=20,nullable=false)
	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	@Column(name="parent_id", length=20, nullable=false)
	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	@Column(length=40)
	public String getRel() {
		return rel;
	}

	public void setRel(String rel) {
		this.rel = rel;
	}

	@ManyToMany(targetEntity=Role.class,mappedBy="menu",fetch=FetchType.LAZY)
	public Set<Role> getRole() {
		return role;
	}

	public void setRole(Set<Role> role) {
		this.role = role;
	}

	@OneToMany(cascade=CascadeType.ALL,mappedBy="menu",targetEntity=Function.class,fetch=FetchType.LAZY)
	public Set<Function> getFunction() {
		return function;
	}

	public void setFunction(Set<Function> function) {
		this.function = function;
	}

	@Transient
	public List<Menu> getChildList() {
		return ChildList;
	}

	public void setChildList(List<Menu> childList) {
		ChildList = childList;
	}

	@Override
	public int compareTo(Menu o) {
		// TODO Auto-generated method stub
		return o.getMenuId();
	}
	

}
