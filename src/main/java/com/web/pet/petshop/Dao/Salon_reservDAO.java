package com.web.pet.petshop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.member.model.Member;
import com.web.pet.petshop.model.Salon_reservBean;



@Repository
public class Salon_reservDAO {

	@Autowired 
	private SessionFactory sessionFactory;
	
	public void insertSalon_reserv(Salon_reservBean salon_reservBean,Integer uid) {
		Session session=sessionFactory.getCurrentSession();
		salon_reservBean.setMember(session.get(Member.class, uid));
		session.save(salon_reservBean);
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]>  updatereserv(Integer sid) {
		Session session=sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select * from Salon_reserv where id =:sid";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("sid", sid);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	public Salon_reservBean originBean(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Salon_reservBean salon_reservBean = session.get(Salon_reservBean.class, id);
		return  salon_reservBean;
	}
	
	public void newupdate(Salon_reservBean salon_reservBean) {
		Session session = sessionFactory.getCurrentSession();
		session.merge(salon_reservBean);
	}

}
