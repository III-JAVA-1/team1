package com.web.pet.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;

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
public class NewEditWithModelAttribute {
	
	@Autowired
	ArticleService service;	
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	@ModelAttribute
	@RequestMapping("/insertPost")//送到預覽頁面
	public ModelAndView insertPost(			
			Article article,//資料來自前端
			@RequestParam(value = "image", required=false) MultipartFile image,  
            HttpServletRequest request                
            ) throws IOException{		
		
		//	這裡要insert一筆Article紀錄，不過因為尚未寫入資料庫，所以u_Id要從session取得
		Integer u_id = Integer.valueOf(request.getSession().getAttribute("user").toString());
		if (image != null && !image.isEmpty()) {
			try {
				byte[] b = image.getBytes();
				Blob blob = new SerialBlob(b);
				article.setPic(blob);
				
				service.saveArticle(article,u_id);//insertArticle(傳Member表主鍵去Dao)
				System.out.println("預覽成功......");					
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}		
		
		service.saveArticle(article,u_id);//沒有insert圖片
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("articleModel", article);//加到@ModelAttribute中
		mv.addObject("editStatus","新增");
		mv.setViewName("forward:/PetForum/preview.jsp");
		
		return mv;
	}
	
	
	@RequestMapping("/showAtPreview")//為了在預覽頁面顯示寵物的圖片，依賴這個方法獲取posterUid
	public @ResponseBody Article showAtPreview(	
		   @RequestParam Integer posterUid,
		   @ModelAttribute("articleModel") Article articleModel
			) {		
		if(posterUid == null) {return null;}			
		
		return articleModel;
	}
	
	@RequestMapping(value="/getPetPic")//preview.jsp,postDetail.jsp秀出寵物圖片
	public ResponseEntity<byte[]> getPetPic(@RequestParam Integer posterUid) {
		byte[] body = null;
		ResponseEntity<byte[]> resp = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		Article article = service.getArticle(posterUid);
		Blob blob = article.getPic();
		if(blob==null) {
			return null;
		}else {
			body = BlobToByteArray.blobToByteArray(blob);
			resp = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
			return resp;
		}	
	}
	
	
	
	@RequestMapping("/commitEdit")
	public void commitEdit(
			@RequestParam("preview")String preview,
			Article article,
			@ModelAttribute("articleModel") Article articleModel,
			HttpServletResponse response) throws IOException {
			PrintWriter out = response.getWriter();			
			response.setContentType(CONTENT_TYPE);
		
			if("新增".equals(preview)) {
					//文章預覽時，就已insert		
					out.print("<script>");
					out.print("window.alert('文章新增成功');window.location.href='../PetForum/forum.jsp';");
					out.print("</script>");	
			}
			else if("取消發佈".equals(preview)) {//從資料庫刪除
				out.print("<script>");
				out.print("window.confirm('確定取消嗎？文章將被捨棄！'); window.location.href='../PetForum/forum.jsp';");
				out.print("</script>");
				service.deleteArticle(articleModel);
			}
			
	}
	
}
