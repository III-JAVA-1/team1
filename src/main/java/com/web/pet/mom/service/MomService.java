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
	
	/**
	 * 
	 * 寫入保母資料
	 * @param mom
	 * @param u_Id
	 */
    public void insertMom(Mom mom , Integer u_Id){
       petMomDAO.insertMom(mom , u_Id);
    }
    
    /**
     * 
     * 取得首頁資料
     * @param country
     * @param title
     * @return
     */
    public List<Mom> getAllMoms(String country, String title){
    	return petMomDAO.getAllMoms(country,title);
    }
    
    /**
     * 
     * 取得預約資料
     * @param mom_Id
     * @return
     */
    public List<Mom> getReservtion(Integer mom_Id){
    	return petMomDAO.getReservtion(mom_Id);
    }
    
    /**
     * 
     * 顯示圖片
     * @param mom_Id
     * @return
     */
    public Mom showPic(Integer mom_Id) {
    	return petMomDAO.showPic(mom_Id);	
	}
}
