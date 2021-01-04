package com.web.pet.mom.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.Mom;

@Service
@Transactional
public class MomService {
	
	@Autowired
    private PetMomDAO petMomDAO;
	
    public void insertMom(Mom mom , Integer u_Id){
       petMomDAO.insertMom(mom , u_Id);
    }
    
    public List<Mom> getAllMoms(String country, String title){
    	return petMomDAO.getAllMoms(country,title);
    }
}
