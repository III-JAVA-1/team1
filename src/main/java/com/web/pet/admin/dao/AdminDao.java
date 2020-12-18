package com.web.pet.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.member.model.Member;

@Repository
public class AdminDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Member> membernamesearchDao(String user_name,Integer page){//admin member依名字查詢
		List<Member> list = new ArrayList<Member>();
		Session session = sessionFactory.getCurrentSession();
		Query<Member> query=null;
		String hql = "FROM Member where name like '%"+user_name+"%'";
		query= session.createQuery(hql).setFirstResult(0).setMaxResults(10);
		if(page!=null) {
			if(page==1) {query= session.createQuery(hql).setFirstResult(0).setMaxResults(10);}
			if(page==2) {query= session.createQuery(hql).setFirstResult(10).setMaxResults(20);}
			if(page==3) {query= session.createQuery(hql).setFirstResult(20).setMaxResults(30);}
			if(page==4) {query= session.createQuery(hql).setFirstResult(30).setMaxResults(40);}
		} else {
			query= session.createQuery(hql).setFirstResult(0).setMaxResults(10);
		}
		
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}

}
