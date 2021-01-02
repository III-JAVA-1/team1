package com.web.pet.petshop.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.pet.petshop.Dao.Salon_reservDAO;
import com.web.pet.petshop.model.Salon_reservBean;

@Service
@Transactional
public class Salon_service {

	@Autowired 
	Salon_reservDAO salon_reservDAO;
 
	

	
	
	public void insertSalin(Salon_reservBean salon_reservBean,Integer uid) {
		salon_reservDAO.insertSalon_reserv(salon_reservBean,uid);
		
	}
	
	public int deleteSalon_reserv(String name,String phone) {
		return salon_reservDAO.deleteSalon_reserv(name,phone);
		
	}
//	public void  updaSalon_reserv(Salon_reservBean salon_reservBean) {
//		
//		
//	salon_reservDAO.updaSalon_reserv(salon_reservBean);
//		
//	}
//	
	

}