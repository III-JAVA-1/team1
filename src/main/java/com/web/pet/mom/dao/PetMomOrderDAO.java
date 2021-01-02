package com.web.pet.mom.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.PetMomOrder;

@Repository
public class PetMomOrderDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	/**
	 * 
	 * 寫入預約保母資料
	 * @param petMomOrder
	 * @param mom_Id
	 */
	public void insertPetMomOrder(PetMomOrder petMomOrder , Integer mom_Id) {
		Session session = sessionFactory.getCurrentSession();
		petMomOrder.setMom(session.get(Mom.class, mom_Id));
		session.save(petMomOrder);
	}
}

