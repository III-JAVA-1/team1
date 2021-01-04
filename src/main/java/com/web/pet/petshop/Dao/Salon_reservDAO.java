package com.web.pet.petshop.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	
	
	public int deleteSalon_reserv(String name,String phone) {
		int count=0;
		Session session=sessionFactory.getCurrentSession();
		String hql ="DELETE FROM Salon_reservBean where name=:name ";
		//session.delete(salon_reservBean);
		count=session.createQuery(hql).setParameter("name", name).executeUpdate();
		
		count++;
		return count;
	}
	public int  updaSalon_reserv( Salon_reservBean salon_reservBean,Integer id) {
		
		int count=0;
		Session session=sessionFactory.getCurrentSession();
		
		session.merge(salon_reservBean);
		//count=session.createQuery(hql).setParameter("date", datee).executeUpdate();
		//session.merge();
		count++;
		return count;
	
	}
	
	
	
}
