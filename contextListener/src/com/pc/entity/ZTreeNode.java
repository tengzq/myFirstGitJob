package com.pc.entity;
/**
 * zTree节点类
 * @author lilei
 *
 */
public class ZTreeNode {
	//TreeNodeID
	private String id=null;
	//节点名称
	private String name=null;
	//是否为父节点
	private String isParent=null;
	//图标
	private String icon=null;
	//设置选中
	private String checked=null;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsParent() {
		return isParent;
	}
	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
	
}
