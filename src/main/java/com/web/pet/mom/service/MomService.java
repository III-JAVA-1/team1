package com.web.pet.mom.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.MomBean;

@Service
@Transactional
public class MomService {
	
	@Autowired
    private PetMomDAO petMomDAO;
	
    public void insertMom(MomBean mb){
       petMomDAO.insertMom(mb);
    }
}
