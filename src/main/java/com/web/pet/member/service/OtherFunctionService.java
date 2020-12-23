package com.web.pet.member.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.web.pet.member.dao.OtherFunctionDao;

@EnableTransactionManagement
@Transactional
@Service
public class OtherFunctionService {
	
	@Autowired
	private OtherFunctionDao otherFunctionDao;
	
	public List<Object[]> shoporderService(String user_id,String queue,Integer page){//會員頁面秀出訂單
		
		return otherFunctionDao.shoporderDao(user_id,queue,page);
	}
	
	public List<Object[]> favoritestoreService(String user_id){//會員頁面秀出收藏商品
		
		return otherFunctionDao.shopfavorite(user_id);
	}
	
	public List<Object[]> shoprateService(String user_id){//會員頁面秀出商品評價
		
		return otherFunctionDao.shoprateDao(user_id);
	}
	
	public List<Object[]> memberarticleService(Integer user_id){//會員頁面文章記錄
	
		return otherFunctionDao.articlememberDao(user_id);
	}

}
