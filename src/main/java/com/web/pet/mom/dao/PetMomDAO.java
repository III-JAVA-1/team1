package com.web.pet.mom.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.member.model.Member;
import com.web.pet.mom.model.Mom;


@Repository
public class PetMomDAO {
	
	@Autowired
    private SessionFactory sessionFactory;
	
    public void insertMom(Mom mom , Integer u_Id) {
        Session session = sessionFactory.getCurrentSession();
        mom.setMember(session.get(Member.class, u_Id));
        session.save(mom);     
    }
    
    @SuppressWarnings("unchecked") //依縣市標題
	public List<Mom> getAllMoms(String country ,String title) {
    	if(country == null) {
    		country="";
    		}
    	if(title == null) {
    		title ="";
    	}
    	String sql = "select Member.country , MOM.title , Member.sname ,Mom.bodyType1"
    			+ ",Mom.bodyType2,Mom.bodyType3,Mom.bodyType4,Mom.notices"
    			+ ",Mom.proPrice1,Mom.proPrice2,Mom.proPrice3"
    			+ ",Mom.mom_Id\r\n"
    			+ "from Member,MOM\r\n"
    			+ "where MOM.u_Id=Member.u_Id\r\n"
    			+ "and Member.country like '%"+country+"%'\r\n"
    			+ "and MOM.title like '%"+title+"%'";
    	List<Mom> list =new ArrayList<Mom>();
    	Session session = sessionFactory.getCurrentSession();
    	list = session.createNativeQuery(sql).getResultList();
    	
    	return list;
	}
    
 
    
    
}
