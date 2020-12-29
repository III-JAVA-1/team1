package com.web.pet.Active.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.Active.model.ActBean;
import com.web.pet.Active.model.JoinActBean;
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
	public void insertActController(ActBean actbean,HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType(CONTENT_TYPE);
		PrintWriter out= response.getWriter();
		Integer uid = Integer.valueOf(request.getSession().getAttribute("user").toString());
		actservice.insertActService(actbean,uid);
		out.print("<script>");
		out.print("window.alert('活動新增成功'); window.location.href='../Active/ActIndex.jsp';");
		out.print("</script>");
		out.close();
	}
	

	@RequestMapping(value = "/Activity") //ajax查詢活動有哪些
	@ResponseBody
	public List<ActBean> ajaxActController(){
		List<ActBean> list = new ArrayList<ActBean>();
		list = actservice.ajaxActService();
		return list;		
	}
	
	@RequestMapping(value = "/ActDetail") //ajax查詢特定活動
	@ResponseBody
	public List<ActBean> ajaxActController(@RequestParam Integer act_no){
		List<ActBean> list = new ArrayList<ActBean>();
		list = actservice.ajaxActService(act_no);
		return list;
		
		
	}
	
	@PostMapping(value="/insertJoinAct") //參加活動
	public void insertJoinController(JoinActBean joinactbean,HttpServletResponse response,HttpServletRequest request, Integer act_no) throws IOException {
		
		response.setContentType(CONTENT_TYPE);
		PrintWriter out= response.getWriter();
		
		Integer uid = Integer.valueOf(request.getSession().getAttribute("user").toString());
		
		actservice.insertJoinService(joinactbean,uid,act_no);
		out.print("<script>");
		out.print("window.alert('成功參加活動');window.location.href='../Active/ActIndex.jsp';");
		out.print("</script>");
		out.close();
	}
	
//	@RequestMapping(value = "/WhatJoin") //ajax查詢會員參加的活動
//	@ResponseBody
//	public List<JoinActBean> ajaxWhatJoin(@RequestParam Integer act_no){
//		List<JoinActBean> list = new ArrayList<JoinActBean>();
//		list = actservice.ajaxActService(act_no);
//		return list;
//		
//		
//	}

}
