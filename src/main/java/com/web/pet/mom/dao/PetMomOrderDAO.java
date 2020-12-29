package com.web.pet.mom.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.mom.model.PetMomOrder;

@Repository
public class PetMomOrderDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	public void insertPetMomOrder(PetMomOrder petMomOrder) {
		Session session = sessionFactory.getCurrentSession();
		session.save(petMomOrder);
	}

	
}

