package com.web.pet.Active.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.pet.Active.dao.ActDao;
import com.web.pet.Active.model.ActBean;
import com.web.pet.Active.model.JoinActBean;

@EnableTransactionManagement
@Transactional
@Service
public class ActService {
	@Autowired
	private ActDao actDao;
	
	public void insertActService(ActBean actbean,Integer uid) {
		actDao.insertActDao(actbean,uid);
	}

//	public List<ActBean> getAllAct() {
//		// TODO Auto-generated method stub
//		return actDao.getAllAct();
//	}

	public List<ActBean> ajaxActService() {
		// TODO Auto-generated method stub
		return actDao.ajaxActDao();
	}

	public List<ActBean> ajaxActService(Integer act_no) {
		// TODO Auto-generated method stub
		return actDao.ajaxActDao(act_no);
	}

	public void insertJoinService(JoinActBean joinactbean) {
		// TODO Auto-generated method stub
		actDao.insertJoinDao(joinactbean);
		
	}
	
	
}
