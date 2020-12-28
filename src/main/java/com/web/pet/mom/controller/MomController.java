package com.web.pet.mom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.PetMomOrder;
import com.web.pet.mom.service.MomService;
import com.web.pet.mom.service.PetMomOrderService;

//@WebServlet("/MomRegister")
@Controller
@RequestMapping("/i19")
@SessionAttributes("user")
public class MomController{
	
	@Autowired
	MomService momService;
	
	@Autowired
	PetMomOrderService petMomOrderService;
	
	@PostMapping(value = "/insertMom" , produces = "application/json; charset=utf-8")
	public String insertMom(@ModelAttribute("user") Mom mom) {
		momService.insertMom(mom);
		return "insertMom";			
	}	
	
	@GetMapping("/extar")
	public String list(Model model) {
		List<Mom> list = momService.getAllMoms();
		model.addAttribute("mom" , list);
		return "extar";
	}
	
	@PostMapping(value = "/reservtionMom" , produces = "application/json; charset=utf-8")
	public String insertPetMomOrder(@ModelAttribute("user") PetMomOrder petMomOrder) {
		petMomOrderService.insertPetMomOrder(petMomOrder);
		return "reservtionMom";			
	}	
}
