package com.web.pet.mom.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.pet.mom.dao.PetMomOrderDAO;
import com.web.pet.mom.model.PetMomOrder;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
public class PetMomOrderService {
	
	@Autowired
	PetMomOrderDAO petMomOrderDAO;

	public void insertPetMomOrder(PetMomOrder petMomOrder , Integer mom_Id) {
		
		petMomOrderDAO.insertPetMomOrder(petMomOrder, mom_Id);
		
	}
	
	
	
}
