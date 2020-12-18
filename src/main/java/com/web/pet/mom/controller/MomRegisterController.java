package com.web.pet.mom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.pet.mom.model.MomBean;
import com.web.pet.mom.service.MomService;

//@WebServlet("/MomRegister")
@Controller
@RequestMapping("/i19")
public class MomRegisterController{
	
	@Autowired
	MomService momService;
	
	@PostMapping(value = "/insertMom" , produces = "application/json; charset=utf-8")
	public void insertMom(MomBean mBean,Model model) {		
		
		momService.insertMom(mBean);
		model.addAttribute("<script>");
		model.addAttribute("window.alert('註冊成功')");
		model.addAttribute("</script>");	
		
	}	
}
