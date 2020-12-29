package com.web.pet.petshop.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.petshop.model.Salon_reservBean;



@Repository
public class Salon_reservDAO {

	@Autowired 
	private SessionFactory sessionFactory;
	
	public void insertSalon_reserv(Salon_reservBean salon_reservBean) {
		//salon_reservBean.setMember(null);
		//Session session = sessionFactory.getCurrentSession();
		Session session=sessionFactory.getCurrentSession();
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
//	public int  updaSalon_reserv(String name,  Date  datee) {
//		
//		int count=0;
//		Session session=sessionFactory.getCurrentSession();
//		String hql="update from Salon_reservBean where  "
//		count=session.createQuery(hql).setParameter("", datee).executeUpdate();
//		count++;
//		return count;
//	
//	}
	
	
	
	
	
}
