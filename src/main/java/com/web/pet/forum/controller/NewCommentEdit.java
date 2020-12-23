package com.web.pet.forum.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.web.pet.forum.model.Comment;
import com.web.pet.forum.service.CommentService;

@RequestMapping("/petforum")
@Controller
public class NewCommentEdit {

	@Autowired
	CommentService service;	

	@RequestMapping("/commitComment")
	public String commitComment(
			Comment comment,
			@RequestParam(value = "posterUid",required = false) Integer posterUid,
			@RequestParam(value = "u_Id",required = false) Integer u_Id
			) {
		//把從前端送來的Comment物件insert到資料庫
		
		System.out.println("=========="+posterUid);
		System.out.println("----------"+u_Id);
		System.out.println("++++++++++"+comment.getCommentContent());
		service.saveComment(comment, posterUid, u_Id);
		
		return "redirect:/PetForum/postDetail.jsp?posterUid="+posterUid+"&u_Id="+u_Id;
	}
	
	
	@RequestMapping("/viewComment")//AJAX把comment帶到postDetail.jsp
	public @ResponseBody List<Object[]> viewComment(			
		    @RequestParam(required = false) Integer posterUid) {
		System.out.println("aaaaaa"+posterUid);
		if(posterUid == null) {return null;}
			
		List<Object[]> list = service.getCommentByPosterUid(posterUid);		
		return list;
	}
	
}
