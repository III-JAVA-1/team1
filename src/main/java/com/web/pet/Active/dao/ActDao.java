package com.web.pet.Active.dao;



import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.Active.model.ActBean;

@Repository
public class ActDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	public void insertActDao(ActBean actbean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(actbean);
	}
	
	@SuppressWarnings("unchecked")
	public List<ActBean> getAllAct(){
		String hql = "FROM ActBean";
		Session session = null;
		List<ActBean> list = new ArrayList<ActBean>();
		session = sessionFactory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	

//	@SuppressWarnings({ "unchecked", "unused" })
//	public List<ActBean> ajaxActDao(){
//		List<ActBean> list = new ArrayList<ActBean>();
//		String hql = "FROM ActBean";
//		Query<ActBean> query= sessionFactory.getCurrentSession().createQuery(hql);
//	
//		return query.getResultList();
//	}
	
}
