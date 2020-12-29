package com.web.pet.Active.dao;



import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.Active.model.ActBean;
import com.web.pet.Active.model.JoinActBean;
import com.web.pet.member.model.Member;

@Repository
public class ActDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	//新增活動
	public int insertActDao(ActBean actbean,Integer uid) {
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		actbean.setMember(session.get(Member.class, uid));
		session.save(actbean);
		count++;
		return count;
	}
	
//	@SuppressWarnings("unchecked")
//	public List<ActBean> getAllAct(){
//		String hql = "FROM ActBean";
//		Session session = null;
//		List<ActBean> list = new ArrayList<ActBean>();
//		session = sessionFactory.getCurrentSession();
//		list = session.createQuery(hql).getResultList();
//		return list;
//	}
	
	
	//ajax查詢活動有哪些
	@SuppressWarnings("unchecked")
	public List<Object[]> ajaxActDao(String acttype){
		Session session = sessionFactory.getCurrentSession();
		if(acttype==null) {acttype="";}
		List<Object[]> list = new ArrayList<Object[]>();
		String hql = "select act_no,act_name,starttime,endtime,act_content,act_organize,act_orgman,act_orgphone,act_type\r\n"
				+ "FROM Active2\r\n"
				+ "WHERE act_type like '%"+acttype+"%'\r\n"
				+ "and viableNumber=1";
		Query<Object[]> query= session.createSQLQuery(hql);
		list=query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			
			return list;
		}
	}

	//ajax查詢特定活動
	@SuppressWarnings("unchecked")
	public List<ActBean> ajaxActDao(Integer act_no) {
		List<ActBean> list = new ArrayList<ActBean>();
		String hql = "FROM ActBean where act_no = :actno";
		Query<ActBean> query= sessionFactory.getCurrentSession().createQuery(hql).setParameter("actno",act_no);
		list=query.getResultList();
		return list;
	}

	//參加活動
	public void insertJoinDao(JoinActBean joinactbean,Integer uid,Integer act_no) {
		Session session = sessionFactory.getCurrentSession();
		joinactbean.setMember(session.get(Member.class,uid));
		joinactbean.setActBean(session.get(ActBean.class,act_no));
		session.save(joinactbean);
		
	}
	
	//ajax查詢會員參加的活動
	@SuppressWarnings("unchecked")
	public List<Object> ajaxWhatJoinDao(Integer u_Id) {
		List<Object> list = new ArrayList<Object>();
		String hql = "select act_name,extra,join_actnow,jid,act_no FROM JoinAct where u_Id = :userid";
		Session session = sessionFactory.getCurrentSession();
		Query<Object> query= session.createNativeQuery(hql).setParameter("userid",u_Id);
		list=query.list();
		return list;
	}
	
	//ajax查詢會員參加的活動(未解問題)
//	@SuppressWarnings("unchecked")
//	public List<JoinActBean> ajaxWhatJoinDao(Integer u_Id) {
//		List<JoinActBean> list = new ArrayList<JoinActBean>();
//		String hql = "select act_name,JoinTime,join_actnow,jid,act_no FROM JoinActBean where u_Id = :userid";
//		Session session = sessionFactory.getCurrentSession();
//		Query<JoinActBean> query= session.createNativeQuery(hql).setParameter("userid",u_Id);
//		list=query.getResultList();
//		return list;
//	}


	//取消參加活動
	public void nojoinDao(Integer jid) {
		Session session = this.sessionFactory.getCurrentSession();
		JoinActBean joinActBean=session.get(JoinActBean.class, jid);
		joinActBean.setJoin_actnow("取消參加");
		session.merge(joinActBean);
		return;
	}


	//幫活動圖片抓全部東西
	public ActBean AllActDao(Integer act_no) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ActBean.class,act_no);
	}

	
}
