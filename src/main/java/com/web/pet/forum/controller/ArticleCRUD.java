package com.web.pet.forum.controller;

import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.pet.forum.model.Article;
import com.web.pet.forum.service.ArticleFavoriteService;
import com.web.pet.forum.service.ArticleService;
import com.web.pet.member.model.Member;
import com.web.pet.member.service.MemberService;
import com.web.pet.util.BlobToByteArray;


@RequestMapping("/petforum")
@Controller
public class ArticleCRUD{
	
	@Autowired
	ArticleService service;	
	@Autowired
	MemberService memberService;
	@Autowired
	ArticleFavoriteService favoriteService;
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	
	@RequestMapping("/selectForum")//AJAX按不同討論區找文章 -  click a標籤
	public 	@ResponseBody
	List<Article> selectForum(String forumId){		
		if(forumId == null) {return null;}
		List<Article> list = service.getArticleByForumId(forumId);		
		return list;
	}
	
	@RequestMapping("/selectAll")//AJAX網頁開啟加載所有文章 - $().ready	
	public @ResponseBody
	List<Article> selectAll(@RequestParam(value = "forumId",required = false) String forumId){
		if(forumId == null) {return null;}
		List<Article> list = service.getArticleByForumId(forumId);		
		return list;
	}	
	
	
	
	@GetMapping("/selectHeader")//按關鍵字找文章
	public @ResponseBody
	List<Article> selectHeader(@RequestParam("inputText") String inputText) {
		if(inputText == null) {return null;}
		List<Article> list = service.getArticleByHeaderKey(inputText);
		
		return list;
	}
	
	
	@RequestMapping("/viewPost")//AJAX把article帶到postDetail.jsp
	public @ResponseBody
	List<Object[]> viewPost(@RequestParam(required = false) Integer posterUid,
			HttpServletRequest request) {
		
		if(posterUid == null) {return null;}
		System.out.println("posterUid"+posterUid);
		//需要的是閱讀者的u_Id，非發文者的u_Id		
		Integer u_Id = Integer.valueOf(request.getSession().getAttribute("user").toString());
		System.out.println("u_Id"+u_Id);
		
		List<Object[]> list = null;
		//取得favoriteId
		List<Object[]> temp = favoriteService.getArticleFavoriteBy2Uid(u_Id, posterUid);
		if(temp != null) {
			for(Object o: temp) {
				System.out.println("123");
				Integer favoriteId = (Integer)o;
				
				System.out.println("favoriteId"+favoriteId);
				list = service.getArticleByFavoriteId(favoriteId);//有找到收藏紀錄
			}
		}
		else {
			list = service.getArticleBy2Uid(u_Id, posterUid);//沒找到收藏紀錄
		}
		return list;
	}
	
	
	@RequestMapping(value="/getMemberImg")//postDetail.jsp秀出會員圖片
	public ResponseEntity<byte[]> getAvatar(@RequestParam Integer u_Id) {
		if(u_Id == null) {return null;}
		
		byte[] body = null;
		ResponseEntity<byte[]> resp = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());		
		Member member = memberService.fullmemberService(u_Id);
		Blob blob = member.getImg();
		if(blob==null) {
			return null;
		}else {
			body = BlobToByteArray.blobToByteArray(blob);
			resp = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
			return resp;
		}	
	}
	
	@RequestMapping("/newArticle")//準備發表新文章
	public ModelAndView newPost() {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("articleModel", new Article());
		mv.setViewName("forward:/PetForum/editArticle.jsp");
		
		return mv;
	}
	
	
 }
	