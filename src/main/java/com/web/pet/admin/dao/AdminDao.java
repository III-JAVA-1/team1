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
	public List<Member> membernamesearchDao(String user_name){//admin member依名字查詢
		List<Member> list = new ArrayList<Member>();
		Session session = sessionFactory.getCurrentSession();
		Query<Member> query=null;
		String hql = "select u_id,name,phone,email,sname,zip,country,district,address,momId,gender,birth FROM Member where name like '%"+user_name+"%'";
		query= session.createNativeQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}

}
