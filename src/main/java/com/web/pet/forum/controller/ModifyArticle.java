package com.web.pet.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.web.pet.forum.model.Article;
import com.web.pet.forum.service.ArticleService;

/**
 * @author ching
 *
 */
@RequestMapping("petforum")
@Controller
public class ModifyArticle {
	
	@Autowired
	ArticleService service;	
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	
	/**
	 * @author ching
	 *	傳送原始文章資料
	 */
	@RequestMapping("/sendOriginalPost")
	public ModelAndView sendOriginalPost(@RequestParam("posterUid") Integer posterUid) {
		if(posterUid == null) {return null;}
		
		Article article = service.getArticle(posterUid);
		ModelAndView mv = new ModelAndView();
		mv.addObject("articleModel", article);//修改前的文章物件 - 加到@ModelAttribute中		
		mv.setViewName("forward:/PetForum/modifyArticle.jsp?posterUid="+posterUid);
		//將表單hidden控制項的posterUid參數以StringQuery形式傳到modifyArticle.jsp
		return mv;
	}
	
	
	/**
	 * @author ching
	 *	修改文章
	 */
	@RequestMapping("/modifyPost")
	public void modifyPost(		
			Article article,			
			HttpServletRequest request,
            HttpServletResponse response                
            ) throws IOException{
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();		
		
			//		System.out.println(article.getHeader());
			//		這裡要update一筆Article紀錄，需要Member的u_Id主鍵
			Integer sessionU_Id = Integer.valueOf(request.getSession().getAttribute("user").toString());
			Article modifyArticle = service.getArticle(article.getPosterUid());			
			service.modifyArticle(modifyArticle, sessionU_Id);//沒有update圖片的文章物件			
			
			out.print("<script>");		
			out.print("window.alert('文章修改成功');window.location.href='../PetForum/forum.jsp';");
			out.print("</script>");
		
	}
}
