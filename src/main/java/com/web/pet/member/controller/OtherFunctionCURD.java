package com.web.pet.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.member.service.OtherFunctionService;

@RequestMapping("/Gusty")
@Controller
public class OtherFunctionCURD {
	
	@Autowired
	private OtherFunctionService otherFunctionService;
	
	@RequestMapping("/shoporder")//會員頁面秀出訂單
	@ResponseBody
	public List<Object[]> shoporderController(String user_id,String queue) {
		return otherFunctionService.shoporderService(user_id,queue);
	}

}
