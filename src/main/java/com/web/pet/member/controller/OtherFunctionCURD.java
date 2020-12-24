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

@RequestMapping("/Gusty")
@Controller
public class OtherFunctionCURD {
	
	@Autowired
	private OtherFunctionService otherFunctionService;
	
	@RequestMapping("/shoporder")//會員頁面秀出訂單
	@ResponseBody
	public List<Object[]> shoporderController(String user_id,String queue,Integer page) {
		return otherFunctionService.shoporderService(user_id,queue,page);
	}
	
	@RequestMapping("/favoritestore")//會員頁面秀出收藏商品
	@ResponseBody
	public List<Object[]> favoritestoreController(String user_id) {
		return otherFunctionService.favoritestoreService(user_id);
	}
	
	@RequestMapping("/shoprate")//會員頁面秀出收藏商品
	@ResponseBody
	public List<Object[]> shoprateController(String user_id) {
		return otherFunctionService.shoprateService(user_id);
	}
	
	@RequestMapping("/memberarticle")//會員頁面文章記錄
	@ResponseBody
	public List<Object[]> memberarticleController(Integer user_id) {
		return otherFunctionService.memberarticleService(user_id);
	}

}
