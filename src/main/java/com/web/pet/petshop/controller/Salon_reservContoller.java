package com.web.pet.petshop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.pet.petshop.Service.Salon_service;
import com.web.pet.petshop.model.Salon_reservBean;


@RequestMapping("/Henry")
@Controller
public class Salon_reservContoller {
	
@Autowired
Salon_service salon_service;



//public void  insert(Salon_reservBean salon_reservBean) {
//	
//
//	System.out.println(salon_reservBean.getDatee());
//	System.out.println(salon_reservBean.getType());
//	
//	
//	//ssalon_service.insertSalon_reserv(salon_reservBean);
//	salon_service.insertSalon_reserv(salon_reservBean);
//	
//	
//	
//	
//}



private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
private static final String CHARSET_CODE = "UTF-8";
//新增訂單
@RequestMapping("/insert")
public void inseert(Salon_reservBean salon_reservBean,HttpServletRequest request, HttpServletResponse response) throws IOException{
	
	salon_service.insertSalin(salon_reservBean);
	response.setContentType(CONTENT_TYPE);
    request.setCharacterEncoding(CHARSET_CODE);

    PrintWriter out= response.getWriter();
		out.print("<script>");
		out.print("window.alert('預約成功'); window.location='../Petshop/mainshop.jsp'");
		out.print("</script>");
		out.close();
		
	
	
}






//刪除訂單
@RequestMapping("/delete")
public void  delete(Model model,
		@RequestParam(value="name")String name,
		@RequestParam(value="phone")String phone
		,HttpServletRequest request, HttpServletResponse response) throws IOException {
	salon_service.deleteSalon_reserv(name, phone);
	response.setContentType(CONTENT_TYPE);
    request.setCharacterEncoding(CHARSET_CODE);
	PrintWriter out= response.getWriter();
	out.print("<script>");
	out.print("window.alert('刪除成功'); window.location='../Petshop/mainshop.jsp'");
	out.print("</script>");
	out.close();
	
		}

}
	

