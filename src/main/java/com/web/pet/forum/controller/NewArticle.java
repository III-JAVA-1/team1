package com.web.pet.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.pet.forum.model.Article;
import com.web.pet.forum.service.ArticleService;
import com.web.pet.util.BlobToByteArray;


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
	
//	@RequestMapping(value="/getPetPic")//postDetail.jsp秀出寵物圖片
//	public ResponseEntity<byte[]> getPetPic(@RequestParam("posterUid") Integer posterUid) {
//		if(posterUid == null) {return null;}			
//		
//		byte[] body = null;
//		ResponseEntity<byte[]> resp = null;
//		HttpHeaders headers = new HttpHeaders();
//		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//		Article article = service.getArticle(posterUid);
//		Blob blob = article.getPic();
//		if(blob==null) {
//			return null;
//		}else {
//			body = BlobToByteArray.blobToByteArray(blob);
//			resp = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
//			return resp;
//		}	
//	}
	
}
