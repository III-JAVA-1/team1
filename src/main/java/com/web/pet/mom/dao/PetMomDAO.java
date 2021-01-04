package com.web.pet.mom.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.mom.model.MomBean;


@Repository
public class PetMomDAO {
	
	@Autowired
    private SessionFactory sessionFactory;
	
    public void insertMom(MomBean mb) {
        Session session = sessionFactory.getCurrentSession();
        session.save(mb);
    }
}
