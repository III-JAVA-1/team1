package com.web.pet.member.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.web.pet.member.dao.OtherFunctionDao;
import com.web.pet.mom.model.Mom;
import com.web.pet.store.dto.table.OrderDTO;

@EnableTransactionManagement
@Transactional
@Service
public class OtherFunctionService {
	
	@Autowired
	private OtherFunctionDao otherFunctionDao;
	
	public List<OrderDTO> shoporderService(String userid){//會員頁面秀出訂單
		
		return otherFunctionDao.shoporderDao(userid);
	}
	
	public List<Object[]> shoporderdetailService(Integer orderid){//會員頁面秀出訂單
		
		return otherFunctionDao.shoporderdeatilDao(orderid);
	}
	
	public List<Object[]> favoritestoreService(String user_id){//會員頁面秀出收藏商品
		
		return otherFunctionDao.shopfavorite(user_id);
	}
	
	public int deleteloveService(String product_id,Integer user_id){//會員頁面取消收藏商品
		
		return otherFunctionDao.delteloveDao(product_id,user_id);
	}
	
	public List<Object[]> shoprateService(String user_id){//會員頁面秀出商品評價
		
		return otherFunctionDao.shoprateDao(user_id);
	}
	
	/////////////////////////會員商城功能////////////////////////////////	
	
	public List<Object[]> memberarticleService(Integer user_id){//會員頁面文章記錄
	
		return otherFunctionDao.articlememberDao(user_id);
	}
	
	public List<Object[]> membermessageService(Integer user_id){//會員頁面文章留言
		
		return otherFunctionDao.membermessageDao(user_id);
	}
	
	public List<Object[]> memberlovearticleService(Integer user_id) {//會員頁面文章收藏
		return otherFunctionDao.memberlovearticleDao(user_id);
	}
	
	public int deletelovearticleService(Integer posteruid,Integer user_id) {//會員頁面收藏文章刪除
		return otherFunctionDao.deletelovearticleDao(posteruid, user_id);
	}
	
	/////////////////////////會員論壇功能////////////////////////////////
	
	public List<Object[]> memberactionService(Integer user_id){//會員頁面活動紀錄
		
		return otherFunctionDao.memberactionDao(user_id);
	}
	
	public List<Object[]> memberjoinService(Integer user_id){//會員頁面活動紀錄
		
		return otherFunctionDao.memberjoinDao(user_id);
	}
	
	public List<Object[]> memberalljoinService(Integer aid){//會員頁面活動參加人
		
		return otherFunctionDao.memberalljoinDao(aid);
	}
	
	/////////////////////////會員活動功能////////////////////////////////
	
	public List<Object[]> memberpetshopService(Integer user_id){//會員頁面店家預約
		
		return otherFunctionDao.memberpetshopDao(user_id);
	}
	
	public Integer memberpetshopdeleteService(Integer id){//會員頁面店家預約刪除
		
		return otherFunctionDao.memberpetshopdeleteDao(id);
	}
	
	/////////////////////////會員店家功能////////////////////////////////
	
	public List<Object[]> membermomService(Integer user_id){//會員頁面保母資料修改顯示修改資料
		
		return otherFunctionDao.membermomDao(user_id);
	}
	
	public Integer membereditmomService(Mom mom){//會員頁面保母資料修改
		
		return otherFunctionDao.membereditmomDao(mom);
	}
	
	/////////////////////////會員店家功能////////////////////////////////
}
