package com.web.pet.forum.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.forum.model.Article;
import com.web.pet.forum.model.Comment;
import com.web.pet.forum.service.ArticleService;
import com.web.pet.forum.service.CommentService;


@RequestMapping("/petforum")
@Controller
public class NewComment {
	
	@Autowired
	private CommentService service;
	@Autowired
	private ArticleService articleService;


	@RequestMapping("/commitComment")
	public @ResponseBody List<Object[]> commitComment(
			   @RequestBody Map<String, String> params,		
			   HttpServletRequest request
			) {		
		 	String commentUpdatedtime = params.get("commentUpdatedtime");
	        Integer posterUid = Integer.valueOf(params.get("posterUid"));
	        Integer u_Id = Integer.valueOf(params.get("u_Id"));
	        String commentContent = params.get("commentContent");
		//把從前端送來的Comment物件insert到資料庫
		//需要的是留言者的u_Id，非發文者的u_Id		
		Integer sessionU_Id = null;
		if(request.getSession().getAttribute("user")!=null){
			sessionU_Id = Integer.valueOf(request.getSession().getAttribute("user").toString());			
		}
		
		Comment comment = new Comment();
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		try {
			ts = Timestamp.valueOf(commentUpdatedtime);
			System.out.println(ts);
			} catch (Exception e) {
			e.printStackTrace();
			} 
		comment.setCommentUpdatedtime(ts);
		comment.setCommentContent(commentContent);		
		service.saveComment(comment, posterUid, sessionU_Id);
		if(posterUid == null) {return null;}
		List<Object[]> list = service.getCommentByPosterUid(posterUid);	
		
		Article article = articleService.getArticle(posterUid);
		//Commit評論 reply數加1
		article.setReply(article.getReply() + 1);		
		//存入資料庫
		articleService.saveArticle(article, u_Id);
		
		return list;
	}
	
	
	@RequestMapping("/viewComment")//AJAX把comment帶到postDetail.jsp
	public @ResponseBody List<Object[]> viewComment(			
		    @RequestParam(required = false) Integer posterUid) {
		
		if(posterUid == null) {return null;}
			
		List<Object[]> list = service.getCommentByPosterUid(posterUid);		
		return list;
	}
	
}
