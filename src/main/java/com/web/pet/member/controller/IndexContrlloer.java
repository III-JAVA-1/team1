package com.web.pet.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.member.service.IndexService;

@RequestMapping("/Gusty")
@Controller
public class IndexContrlloer {

	@Autowired
	private IndexService indexService;
	
	
	@RequestMapping("/indexshop")
	@ResponseBody
	public List<Object[]> indexshopController() {//首頁商品
		return indexService.indexshopService();
	}
	
}
