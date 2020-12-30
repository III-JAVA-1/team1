package com.web.pet.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.pet.admin.dao.AdminDao;
import com.web.pet.member.dao.MemberDao;
import com.web.pet.member.model.Member;

@EnableTransactionManagement
@Transactional
@Service
public class AdminService {

	@Autowired
	private AdminDao adaminDao;
	
	public List<Member> membernamesearch(String user_name) {//admin member依名字查詢

		return adaminDao.membernamesearchDao(user_name);
	}
	
	public  List<Object[]> storetop10(Integer month) {//商品銷售Top10
		return adaminDao.storetop10(month);
	}
	
	public  List<Object[]> allsales(Integer month) {//銷售總金額
		return adaminDao.allsales(month);
	}
	
	public  List<Object[]> activehottimeService(Integer month) {//活動顯示時間熱度
		return adaminDao.activehottimeDao(month);
	}
	
	public  List<Object[]> activejointop3Service(Integer month) {//活動顯示參加人數top3
		return adaminDao.activejointop3Dao(month);
	}
	
	public  List<Object[]> activetypeService() {//活動顯示類型比例
		return adaminDao.activetypeDao();
	}
	
	public List<Object[]> activeallService(){//活動顯示全部活動
		return adaminDao.activeallDao();
	}

}
