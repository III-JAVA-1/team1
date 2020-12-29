package com.web.pet.mom.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.mom.model.Mom;


@Repository
public class PetMomDAO {
	
	@Autowired
    private SessionFactory sessionFactory;
	
    public void insertMom(Mom mom) {
        Session session = sessionFactory.getCurrentSession();
        session.save(mom);
    }
    
    public List<Mom> getAllMoms() {
    	String hql = "FROM Mom";
    	List<Mom> list =new ArrayList<Mom>();
    	list = sessionFactory.getCurrentSession().createQuery(hql).getResultList();
    	
    	return list;
	}
    
    
}
