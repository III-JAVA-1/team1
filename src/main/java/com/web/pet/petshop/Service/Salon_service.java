package com.web.pet.petshop.Service;

import java.util.List;

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
	
	public List<Object[]> updateserve(Integer sid){
		return salon_reservDAO.updatereserv(sid);
	}
	
	public Salon_reservBean salonBean(Integer id) {
		return salon_reservDAO.originBean(id);
	}
	
	public void newupdate(Salon_reservBean salon_reservBean) {
		salon_reservDAO.newupdate(salon_reservBean);
	}
	

}