package com.web.pet.petshop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.petshop.Service.PetshopService;
import com.web.pet.petshop.model.PetshopBean;

@RequestMapping("/Henry")
@Controller
public class PetshopController {

	@Autowired
	private PetshopService petshopService;
	
	@RequestMapping("/allpetshop")
	@ResponseBody
	public List<PetshopBean> allpetshopController(String storename,String pettype,String shoptype) {//
		List<PetshopBean> list = new ArrayList<PetshopBean>();
		list = petshopService.allpetshopService(storename,pettype,shoptype);
		return list;
	}  
	
	
}
