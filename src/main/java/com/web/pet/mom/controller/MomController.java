package com.web.pet.mom.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.PetMomOrder;
import com.web.pet.mom.service.MomService;
import com.web.pet.mom.service.PetMomOrderService;

//@WebServlet("/MomRegister")
@Controller
@RequestMapping("/mom")
public class MomController{
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

	private static final String CHARSET_CODE = "UTF-8";
	
	@Autowired
	MomService momService;
	
	@Autowired
	PetMomOrderService petMomOrderService;
	
	@PostMapping(value = "/insertMom" , produces = "application/json; charset=utf-8")
	public void insertMom(Mom mom ,HttpServletResponse response,HttpServletRequest request) throws IOException {
		
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		
		Integer u_Id = Integer.valueOf(request.getSession().getAttribute("user").toString());
		momService.insertMom(mom,u_Id);
		PrintWriter out= response.getWriter();
		out.print("<html>");
		out.print("<body>");
		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
		out.print("<script>");
		out.print("Swal.fire({\r\n"
				+ "  position: 'top-end',\r\n"
				+ "  icon: 'success',\r\n"
				+ "  title: '註冊成功',\r\n"
				+ "  showConfirmButton: false,\r\n"
				+ "  timer: 1500\r\n"
				+ "})");
		out.print("</script>");
		out.print("</body>");
		out.print("<html>");
	}	
	
	@RequestMapping("/allMom")
	@ResponseBody
	public List<Mom> allMom(String country  ,String title){
		List<Mom> list = new ArrayList<Mom>();
		list = momService.getAllMoms(country,title);
		return list;
	}
	
//	@GetMapping(value = "/extar.jsp" , produces = "application/json; charset=utf-8")
//	public String list(Model model) {
//		List<Mom> list = momService.getAllMoms();
//		model.addAttribute("mom" , list);
//		return "mom/extar.jsp";
//	}
	
//	@PostMapping(value = "/reservtionMom" , produces = "application/json; charset=utf-8")
//	public String insertPetMomOrder(@ModelAttribute("user") PetMomOrder petMomOrder) {
//		petMomOrderService.insertPetMomOrder(petMomOrder);
//		return "reservtionMom";			
//	}	
	
	@PostMapping(value = "/reservtionMom" , produces = "application/json; charset=utf-8")
	public void insertPetMomOrder(PetMomOrder petMomOrder ,HttpServletResponse response,HttpServletRequest request) throws IOException {
		
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		
		Integer mom_Id = Integer.valueOf(request.getSession().getAttribute("user").toString());
		petMomOrderService.insertPetMomOrder(petMomOrder,mom_Id);
		PrintWriter out= response.getWriter();
		out.print("<html>");
		out.print("<body>");
		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
		out.print("<script>");
		out.print("Swal.fire({\r\n"
				+ "  position: 'top-end',\r\n"
				+ "  icon: 'success',\r\n"
				+ "  title: '預約成功',\r\n"
				+ "  showConfirmButton: false,\r\n"
				+ "  timer: 1500\r\n"
				+ "})");
		out.print("</script>");
		out.print("</body>");
		out.print("<html>");
	}	
}
