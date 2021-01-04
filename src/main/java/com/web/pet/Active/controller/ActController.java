package com.web.pet.Active.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.pet.Active.model.ActBean;
import com.web.pet.Active.model.JoinActBean;
import com.web.pet.Active.service.ActService;
import com.web.pet.util.BlobToByteArray;

import okhttp3.internal.http.HttpHeaders;


@RequestMapping("/Wu")
@Controller
public class ActController {
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

	private static final String CHARSET_CODE = "UTF-8";
	
	@Autowired
	private ActService actservice;
	
	
	@PostMapping(value="/insertActService") //新增活動
	public void insertActController(ActBean actbean,HttpServletResponse response
									,HttpServletRequest request
									,@RequestParam(value = "img", required=false)MultipartFile img) throws IOException {
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		PrintWriter out= response.getWriter();
		Integer uid = Integer.valueOf(request.getSession().getAttribute("user").toString());
//		System.out.println(act_img);
		if (img != null && !img.isEmpty()) {
		try {
			byte[] b = img.getBytes();
			Blob blob = new SerialBlob(b);
			actbean.setAct_img(blob);
			
			if(actservice.insertActService(actbean,uid)>0) {
				out.print("<script>");
				out.print("window.alert('活動新增成功'); window.location.href='../Active/ActIndex.jsp';");
				out.print("</script>");
			}						
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		  }		
		}		
		else {
			out.print("<script>");
			out.print("window.alert('請選擇照片'); window.location.href='../Active/ActIndex.jsp';");
			out.print("</script>");
		}
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
	public void insertJoinController(JoinActBean joinactbean,
								HttpServletResponse response,
								HttpServletRequest request, 
								Integer act_no) throws IOException {
		
		response.setContentType(CONTENT_TYPE);
		PrintWriter out= response.getWriter();
		
		Integer uid = Integer.valueOf(request.getSession().getAttribute("user").toString());
		
		actservice.insertJoinService(joinactbean,uid,act_no);
		out.print("<script>");
		out.print("window.alert('成功參加活動');window.location.href='../Active/ActIndex.jsp';");
		out.print("</script>");
		out.close();
	}
	
	@RequestMapping(value = "/WhatJoin") //ajax查詢會員參加的活動
	@ResponseBody
	public List<Object> ajaxWhatJoin(@RequestParam Integer u_Id){
//		System.out.println("user"+u_Id);
		List<Object> list = new ArrayList<Object>();
		list = actservice.ajaxWhatJoinService(u_Id);
		return list;		
	}
	
	@RequestMapping(value = "/NoJoin") //取消參加活動
	public void NoJoin(HttpServletResponse response,@RequestParam Integer jid) throws IOException {
		System.out.println("JID = "+jid);
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		actservice.nojoinservice(jid);
		
		out.print("<script>");
		out.print("window.alert('已取消');window.location.href='../Active/ActCheck.jsp';");
		out.print("</script>");
		out.close();

	}
	
	@RequestMapping(value = "/getimg")//幫活動圖片抓全部東西
	public ResponseEntity<byte[]> getPicture(@RequestParam Integer act_no){
		byte[] body= null;
		ResponseEntity<byte[]> re = null;
		ActBean actBean = actservice.AllActService(act_no);
		Blob blob = actBean.getAct_img();
		if (blob==null) {
			return null;
		}else {
			body = BlobToByteArray.blobToByteArray(blob);
			re = new ResponseEntity<byte[]>(body,HttpStatus.OK);
			return re;
		}

	}
	

}
