package com.pc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pc.util.PageData;


@Repository("daoSupport")
public class DaoSupport implements DAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 保存对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object save(String str, Object obj) throws Exception {
		return sqlSessionTemplate.insert(str, obj);
	}
	
	/**
	 * 批量更新
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object batchSave(String str, List objs )throws Exception{
		return sqlSessionTemplate.insert(str, objs);
	}
	
	/**
	 * 修改对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object update(String str, Object obj) throws Exception {
		return sqlSessionTemplate.update(str, obj);
	
	}
	public Object update(String str) throws Exception {
		return sqlSessionTemplate.update(str);
		
	}
	
	/**
	 * 批量更新
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public void batchUpdate(String str, List objs )throws Exception{
		SqlSessionFactory sqlSessionFactory = sqlSessionTemplate.getSqlSessionFactory();
		//批量执行器
		SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH,false);
		try{
			if(objs!=null){
				for(int i=0,size=objs.size();i<size;i++){
					sqlSession.update(str, objs.get(i));
				}
				sqlSession.flushStatements();
				sqlSession.commit();
				sqlSession.clearCache();
			}
		}finally{
			sqlSession.close();
		}
	}
	
	/**
	 * 批量更新
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object batchDelete(String str, List objs )throws Exception{
		return sqlSessionTemplate.delete(str, objs);
	}
	
	/**
	 * 删除对象 
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object delete(String str, Object obj) throws Exception {
		return sqlSessionTemplate.delete(str, obj);
	}
	 
	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object findForObject(String str, Object obj) throws Exception {
		return sqlSessionTemplate.selectOne(str, obj);
	}

	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object findForList(String str, Object obj) throws Exception {
		return sqlSessionTemplate.selectList(str, obj);
	}
	
	public Object findForMap(String str, Object obj, String key, String value) throws Exception {
		return sqlSessionTemplate.selectMap(str, obj, key);
	}

	public List<PageData> listGroupAll(String a) {
		return sqlSessionTemplate.selectList(a);
	}

	public List<PageData> test() {
		return sqlSessionTemplate.selectList("YeePayMapper.selectAll");
	}

	public PageData businessLogin(PageData up) {
		return sqlSessionTemplate.selectOne("YeePayMapper.login", up);
	}

	public List<PageData> findNoSh() {
		return sqlSessionTemplate.selectList("YeePayMapper.noShbusiness");
	}

	public void upBtis(PageData pdData) {
		sqlSessionTemplate.update("YeePayMapper.update_sys_business_user_isdelete", pdData);
	}

	public List<PageData> getAllProjectCP() {
		return sqlSessionTemplate.selectList("_ProjectMapper.getAllProjectCP");
	}

	public void save2(String string, PageData pd) {
		sqlSessionTemplate.insert(string, pd);
	}

	public List<PageData> findAllZfUser() {
		return sqlSessionTemplate.selectList("ZfUserMapper.findAllZfUser");
	}

	public List<PageData> findById2(PageData pd) {
		return sqlSessionTemplate.selectList("_ProjectMapper.findById2", pd);
	}

	public List<PageData> findTickedByPid(PageData pd) {
		return sqlSessionTemplate.selectList("_ProjectMapper.findTickedByPid",pd);
	}

	public void update_ticket_state(List<PageData> data1) {
		sqlSessionTemplate.update("_ProjectMapper.update_ticket_state", data1);
	}
	public void update_ticket_state(PageData data1) {
		sqlSessionTemplate.update("_ProjectMapper.update_ticket_state123", data1);
	}
	public void bindBankCard(PageData pd) {
		sqlSessionTemplate.update("YeePayMapper.updateBindBank",pd);
	}
	public void updateUnbindBank(PageData pd) {
		sqlSessionTemplate.update("YeePayMapper.updateUnbindBank",pd);
	}
	public void updateFabu(PageData pdlist2) {
		sqlSessionTemplate.update("YeePayMapper.updateFabu",pdlist2);
	}
	public PageData findById23(PageData user) {
		return sqlSessionTemplate.selectOne("YeePayMapper.findById23", user);
	}
	public PageData findByIdzffoundsflow(PageData pd) {
		return sqlSessionTemplate.selectOne("ZfFundsFlowMapper.findbyid", pd);
	}

	public void update_zf_user_isyeepay(String m) {
		sqlSessionTemplate.update("YeePayMapper.update_zf_user_isyeepay", m);
	}

	public void add_zf_founds_flow(PageData pd) {
		sqlSessionTemplate.insert("ZfFundsFlowMapper.save2",pd);
	}

	public void updateZfUserjiaqianuser(PageData pd) {
		sqlSessionTemplate.update("ZfUserMapper.updateZfUserjiaqianuser", pd);
	}

	public void updatejianqian(PageData pdw) {
		sqlSessionTemplate.update("ZfUserMapper.updateZfUserjiaqianuser2222", pdw);
		
	}

	public PageData findBusinessByid(PageData pdb) {
		return sqlSessionTemplate.selectOne("YeePayMapper.findBusinessByid", pdb);
	}

	public List<PageData> findForList(String string) {
		return sqlSessionTemplate.selectList(string);
	}
}


