package com.pc.entity;

public class Group {

	private Long groupId;
	private String groupName;
	private String groupRemark;
	private Integer groupInsertBy;
	
	public Group(){}
	
	public Group(String groupName){
		this.groupName = groupName;
	}
	
	public Long getGroupId() {
		return groupId;
	}
	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupRemark() {
		return groupRemark;
	}
	public void setGroupRemark(String groupRemark) {
		this.groupRemark = groupRemark;
	}
	public Integer getGroupInsertBy() {
		return groupInsertBy;
	}
	public void setGroupInsertBy(Integer groupInsertBy) {
		this.groupInsertBy = groupInsertBy;
	}
	
	
	
}
