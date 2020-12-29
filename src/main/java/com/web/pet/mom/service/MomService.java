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
	
    public void insertMom(Mom mom){
       petMomDAO.insertMom(mom);
    }
    
    public List<Mom> getAllMoms(){
    	return petMomDAO.getAllMoms();
    }
}
