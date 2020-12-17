package com.web.pet.Active.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.Active.model.ActBean;
import com.web.pet.Active.service.ActService;


@RequestMapping("/Wu")
@Controller
public class ActController {
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	@SuppressWarnings("unused")
	private static final String CHARSET_CODE = "UTF-8";
	
	@Autowired
	private ActService actservice;
	
	
	@PostMapping(value="/insertActService") //新增活動
	public void insertActController(ActBean actbean,HttpServletResponse response) throws IOException {
		
		response.setContentType(CONTENT_TYPE);
		PrintWriter out= response.getWriter();
		
		actservice.insertActService(actbean);
		out.print("<script>");
		out.print("window.alert('活動新增成功'); window.location.href='../Active/ActIndex.jsp;");
		out.print("</script>");
		out.close();
	}
	
	@GetMapping("/ActAll")
	public String list(ActBean actBean){
		List<ActBean> list = actservice.getAllAct();
		actBean.addAttribute("ActAll",list);
		return "ActAll";
		
	}
//	@GetMapping(value = "/Active")
//	@ResponseBody
//	public List<ActBean> ajaxActController(){
//		List<ActBean> list = new ArrayList<ActBean>();
//		list = actservice.ajaxActService();
//		return list;
//		
//	}
	
	

}
