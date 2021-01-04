package com.web.pet.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.member.service.OtherFunctionService;
import com.web.pet.store.dto.table.OrderDTO;

@RequestMapping("/Gusty")
@Controller
public class OtherFunctionCURD {
	
	@Autowired
	private OtherFunctionService otherFunctionService;
	
	@RequestMapping("/shoporder")//會員頁面秀出訂單
	@ResponseBody
	public List<OrderDTO> shoporderController(String userid) {
		return otherFunctionService.shoporderService(userid);
	}
	
	@RequestMapping("/shoporderdetail")//會員頁面秀出訂單詳細資料
	@ResponseBody
	public List<Object[]> shoporderdetailController(Integer orderid) {
		return otherFunctionService.shoporderdetailService(orderid);
	}
	
	@RequestMapping("/favoritestore")//會員頁面秀出收藏商品
	@ResponseBody
	public List<Object[]> favoritestoreController(String user_id) {
		return otherFunctionService.favoritestoreService(user_id);
	}
	
	@RequestMapping("/deletlove")//會員頁面取消收藏商品
	@ResponseBody
	public int deleteloveController(String product_id) {
		return otherFunctionService.deleteloveService(product_id);
	}
	
	@RequestMapping("/shoprate")//會員頁面秀出商品評價
	@ResponseBody
	public List<Object[]> shoprateController(String user_id) {
		return otherFunctionService.shoprateService(user_id);
	}
	
	@RequestMapping("/memberarticle")//會員頁面文章記錄
	@ResponseBody
	public List<Object[]> memberarticleController(Integer user_id,String search) {
		return otherFunctionService.memberarticleService(user_id,search);
	}
	
	@RequestMapping("/membermessage")//會員頁面文章留言
	@ResponseBody
	public List<Object[]> membermessageController(Integer user_id){
		return otherFunctionService.membermessageService(user_id);
	}
	
	@RequestMapping("/memberaction")//會員頁面活動紀錄
	@ResponseBody
	public List<Object[]> memberactionController(Integer user_id,String search){
		return otherFunctionService.memberactionService(user_id, search);
	}
	
	@RequestMapping("/memberjoin")//會員頁面活動參加紀錄
	@ResponseBody
	public List<Object[]> memberjoinController(Integer user_id){
		return otherFunctionService.memberjoinService(user_id);
	}

}
