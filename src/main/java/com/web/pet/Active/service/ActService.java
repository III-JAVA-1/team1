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
	
	//新增活動
	public int insertActService(ActBean actbean,Integer uid) {
		return actDao.insertActDao(actbean,uid);
	}
	
	
	//ajax查詢活動有哪些
	public List<ActBean> ajaxActService() {
		return actDao.ajaxActDao();
	}
	
	
	//ajax查詢特定活動
	public List<ActBean> ajaxActService(Integer act_no) {
		return actDao.ajaxActDao(act_no);
	}

	//參加活動
	public void insertJoinService(JoinActBean joinactbean,Integer uid,Integer act_no) {
		actDao.insertJoinDao(joinactbean, uid, act_no);
		
	}
	
	//ajax查詢會員參加的活動
	public List<Object> ajaxWhatJoinService(Integer u_Id) {
		return actDao.ajaxWhatJoinDao(u_Id);
	}

	//取消參加活動
	public void nojoinservice( Integer jid) {
		actDao.nojoinDao(jid);
		return;
	}



	public ActBean AllActService(Integer act_no) {
		
		return actDao.AllActDao(act_no);
	}


	

	
}
