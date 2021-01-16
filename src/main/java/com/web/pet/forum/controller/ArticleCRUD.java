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
import com.web.pet.forum.model.ListWithPaging;
import com.web.pet.forum.service.ArticleFavoriteService;
import com.web.pet.forum.service.ArticleService;
import com.web.pet.member.model.Member;
import com.web.pet.member.service.MemberService;
import com.web.pet.util.BlobToByteArray;


/**
 *  Class Name: ArticleCRUD.java
 *  Description: 
 *  @author ching  DateTime 2021/1/14 下午 01:28:39 
 *  @company 
 *  @email public192021@gmail.com
 *  @version 1.0
 */
@RequestMapping("/petforum")
@Controller
public class ArticleCRUD{
	
	@Autowired
	private ArticleService service;	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ArticleFavoriteService favoriteService;
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	

	/**
	 *  Description: AJAX按不同討論區找文章 -  click a標籤
	 *  AJAX網頁開啟加載所有文章 - $().ready
	 *  @author ching  DateTime 2021/1/14 下午 01:15:35
	 *  @param forumId
	 *  @param page
	 *  @return
	 */
	@RequestMapping(value={"/selectForum", "/selectAll"})
	public 	@ResponseBody
	ListWithPaging selectForum(
			@RequestParam(value = "forumId",required = false) String forumId,
			@RequestParam(value = "page", required = false) Integer page
			){			
		if(forumId == null) {return null;}
		ListWithPaging res = service.getArticleByForumId(forumId, page);		
		return res;
	}
	

	/**
	 *  Description: 按關鍵字找文章
	 *  @author ching  DateTime 2021/1/14 下午 01:16:29
	 *  @param inputText
	 *  @param page
	 *  @return
	 */
	@GetMapping("/selectHeader")
	public @ResponseBody
	ListWithPaging selectHeader(
			@RequestParam("inputText") String inputText,
			@RequestParam(value = "page", required = false) Integer page) {
	
		if(inputText == null) {return null;}
		ListWithPaging list = service.getArticleByHeaderKey(inputText, page);		
		return list;
	}
	

	/**
	 *  Description: 找最新回覆文章
	 *  @author ching  DateTime 2021/1/14 下午 01:16:45
	 *  @param page
	 *  @return
	 */
	@GetMapping("/lastestReply")
	public @ResponseBody
	ListWithPaging selectLastestReply(			
			@RequestParam(value = "page", required = false) Integer page) {		
		ListWithPaging list = service.getArticleByLatestComment(page);		
		return list;
	}
	
	

	/**
	 *  Description: 找前top3瀏覽率文章
	 *  @author ching  DateTime 2021/1/14 下午 01:16:59
	 *  @return
	 */
	@GetMapping(value={"/highestViewing","/highestViewingHeader"})
	public @ResponseBody
	List<Object[]> selectHighestViewing() {		
		List<Object[]> list = service.getArticleByHighestViewing();		
		return list;
	}
	
	

	/**
	 *  Description: AJAX把article帶到postDetail.jsp
	 *  @author ching  DateTime 2021/1/14 下午 01:17:14
	 *  @param posterUid
	 *  @param u_Id
	 *  @param request
	 *  @return
	 */
	@RequestMapping("/viewPost")
	public @ResponseBody
	List<Object[]> viewPost(
			@RequestParam(value="posterUid", required = false) Integer posterUid,
			@RequestParam(value="u_Id",required = false) Integer u_Id,			
			HttpServletRequest request) {
		
		if(posterUid == null) {return null;}
		
		//需要的是閱讀者的u_Id，非發文者的u_Id
		Integer sessionU_Id = null;
		if(request.getSession().getAttribute("user")!=null){
			sessionU_Id = Integer.valueOf(request.getSession().getAttribute("user").toString());		
			System.out.println("sessionU_Id"+sessionU_Id);
		}		
		
		List<Object[]> list = null;
		List<Object[]> temp = null;
		//增加瀏覽率
		Article article = service.getArticle(posterUid);	
		Integer viewing = article.getViewing()+1;
		article.setViewing(viewing);
		
		//更新文章的回應數
		service.setCommentCounts(article);
		
		//取得favoriteId
		if(sessionU_Id != null) {
			temp = favoriteService.getArticleFavoriteBy2Uid(sessionU_Id, posterUid);
		}
		if(temp != null) {
			for(Object o: temp) {
				Integer favoriteId = (Integer)o;				
				list = service.getArticleByFavoriteId(favoriteId);//有找到收藏紀錄
			}
		}
		else {			
			list = service.getArticleBy2Uid(u_Id, posterUid);//沒找到收藏紀錄		
		}		
		return list;
	}
	
	

	/**
	 *  Description: postDetail.jsp秀出會員圖片
	 *  @author ching  DateTime 2021/1/14 下午 01:17:26
	 *  @param u_Id
	 *  @return
	 */
	@RequestMapping(value="/getMemberImg")
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
	
	
	@RequestMapping(value={"/randomArticle", "/randomArticle2"})
	public @ResponseBody
	List<Article> randomArticle(){		
		List<Article> list = service.randomArticle();
		
		return list;
	}
	

	/**
	 *  Description: 準備發表新文章
	 *  @author ching  DateTime 2021/1/14 下午 01:17:39
	 *  @return
	 */
	@RequestMapping("/newArticle")
	public ModelAndView newPost() {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("articleModel", new Article());
		mv.setViewName("forward:/PetForum/editArticle.jsp");
		
		return mv;
	}
	
	
 }
	