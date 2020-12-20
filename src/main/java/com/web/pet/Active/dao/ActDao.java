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
	public void insertActDao(ActBean actbean,Integer uid) {
		Session session = sessionFactory.getCurrentSession();
		actbean.setMember(session.get(Member.class, uid));
		session.save(actbean);
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
	public List<ActBean> ajaxActDao(){
		List<ActBean> list = new ArrayList<ActBean>();
		String hql = "FROM ActBean";
		Query<ActBean> query= sessionFactory.getCurrentSession().createQuery(hql);
		list=query.getResultList();
		return list;
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
	public void insertJoinDao(JoinActBean joinactbean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(joinactbean);
		
	}
	
}
