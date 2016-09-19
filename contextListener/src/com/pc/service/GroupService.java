package com.pc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pc.dao.DaoSupport;
import com.pc.entity.Page;
import com.pc.entity.Group;
import com.pc.util.PageData;


@Service("groupService")
public class GroupService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Group group)throws Exception{
		dao.save("GroupMapper.save", group);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("GroupMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(Group group)throws Exception{
		dao.update("GroupMapper.edit", group);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GroupMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GroupMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GroupMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GroupMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

