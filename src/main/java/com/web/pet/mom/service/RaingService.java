//package com.web.pet.mom.service;
//
//import java.util.List;
//
//import javax.transaction.Transactional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.web.pet.mom.dao.RaingDAO;
//import com.web.pet.mom.model.Raing;
//
//@Service
//@Transactional
//public class RaingService {
//	
//	@Autowired
//	RaingDAO raingDAO;
//	
//	public void insertRaing(Raing raing) {
//		raingDAO.insertRaingDao(raing);
//	}
//	
//	public List<Raing> ajaxSearchRaing(int uId){
//		return raingDAO.ajaxSearchRaing(uId);
//	}
//	
//	public int updateRaing(Raing raing) {
//		return raingDAO.updateRaing(raing);
//	}
//	
//	public int deleteRaing(Raing raing) {
//		return raingDAO.deleteRaing(raing);
//	}
//
//}
