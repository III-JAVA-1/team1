package com.web.pet.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;

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

@RequestMapping("petforum")
@Controller
public class ModifyWithModelAttribute {
	
	@Autowired
	ArticleService service;	
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	@ModelAttribute
	@RequestMapping("/sendOriginalPost")//傳送原始文章資料
	public ModelAndView sendOriginalPost(@RequestParam("posterUid") Integer posterUid) {
		
		Article article = service.getArticle(posterUid);
		ModelAndView mv = new ModelAndView();
		mv.addObject("articleModel", article);//修改前的文章物件		
		mv.setViewName("forward:/PetForum/modifyArticle.jsp?posterUid="+posterUid);
	
		return mv;
	}
	
	
	@RequestMapping("/modifyPost")//修改文章無預覽功能
	public void modifyPost(
			@ModelAttribute("articleModel") Article article,//引入此未修改的欄位才不會有null(來自資料庫)		
			@RequestParam(value = "image", required=false) MultipartFile image,
			HttpServletRequest request,
            HttpServletResponse response                
            ) throws IOException{
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();		
		
		System.out.println(article.getHeader());
//		這裡要update一筆Article紀錄，需要u_Id主鍵
			Integer u_id = Integer.valueOf(request.getSession().getAttribute("user").toString());
			if (image != null && !image.isEmpty()) {
				try {
					byte[] b = image.getBytes();
					Blob blob = new SerialBlob(b);
					article.setPic(blob);					
					service.modifyArticle(article, u_id);//updateArticle
					
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			service.modifyArticle(article, u_id);//沒有update圖片
			
			out.print("<script>");		
			out.print("window.alert('文章修改成功');window.location.href='../PetForum/forum.jsp';");
			out.print("</script>");
		
	}
}
