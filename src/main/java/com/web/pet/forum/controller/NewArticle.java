package com.web.pet.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.web.pet.forum.model.Article;
import com.web.pet.forum.service.ArticleService;



@RequestMapping("/petforum")
@Controller
public class NewArticle {
	
	@Autowired
	private ArticleService service;	
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	

	@RequestMapping("/insertPost")//送到預覽頁面
	public void insertPost(			
			Article article,//資料來自前端			
            HttpServletRequest request,
            HttpServletResponse response 
            ) throws IOException {
		
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();	
		
		//	這裡要insert一筆Article紀錄，不過因為尚未寫入資料庫，所以u_Id要從session取得
		Integer sessionU_Id = Integer.valueOf(request.getSession().getAttribute("user").toString());

		service.saveArticle(article, sessionU_Id);//不用insert圖片的文章物件
		
		out.print("<script>");		
		out.print("window.alert('文章新增成功');window.location.href='../PetForum/forum.jsp';");
		out.print("</script>");
	}	
	

	
}
