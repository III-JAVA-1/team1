package com.web.pet.petshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public void inseert(Salon_reservBean salon_reservBean,HttpServletRequest request, HttpServletResponse response,@RequestParam String datee,@RequestParam String thistimee) throws IOException{
	Timestamp tis = null;//訂單預約時間
	Timestamp tis2 = null;//訂單預約時間
	System.out.println("this"+thistimee);
	try {
		 tis = new Timestamp(
				new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(datee).getTime());
		 tis2 = new Timestamp(
					new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(thistimee).getTime());
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	salon_reservBean.setDate(tis);
	salon_reservBean.setThistime(tis2);
	Integer uid = Integer.valueOf(request.getSession().getAttribute("user").toString());
	salon_service.insertSalin(salon_reservBean,uid);
	response.setContentType(CONTENT_TYPE);
	

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

//修改訂單
//@RequestMapping("/update")
//public void  update(Model model,Salon_reservBean salon_reservBean,
//		
//		HttpServletRequest request, HttpServletResponse response) throws IOException {
//	Timestamp tis = null;//訂單預約時間
//	try {
//		 tis = new Timestamp(
//				new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(datee).getTime());
//		
//	} catch (ParseException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
////	salon_service.updaSalon_reserv(salon_reservBean);
////	//response.setContentType(CONTENT_TYPE);
////	
////    request.setCharacterEncoding(CHARSET_CODE);
////	PrintWriter out= response.getWriter();
////	out.print("<script>");
////	out.print("window.alert('修改成功'); window.location='../Petshop/mainshop.jsp'");
////	out.print("</script>");
////	out.close();
////	
////		}




}
	

