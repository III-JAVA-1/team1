package com.web.pet.forum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import com.web.pet.forum.model.Comment;
import com.web.pet.forum.service.CommentService;
import com.web.pet.forum.webSocket.MsgScoketHandle;
import com.web.pet.member.model.Member;
import com.web.pet.member.service.MemberService;

@RequestMapping("/petforum")
@Controller
public class NewComment {
	
	@Autowired
	private CommentService service;


	@RequestMapping("/commitComment")
	public String commitComment(
			Comment comment,
			@RequestParam(value = "posterUid",required = false) Integer posterUid,
			@RequestParam(value = "u_Id",required = false) Integer u_Id,
			HttpServletRequest request
			) {
		//把從前端送來的Comment物件insert到資料庫
		//需要的是留言者的u_Id，非發文者的u_Id		
		Integer sessionU_Id = null;
		if(request.getSession().getAttribute("user")!=null){
			sessionU_Id = Integer.valueOf(request.getSession().getAttribute("user").toString());		
			System.out.println("sessionU_Id"+sessionU_Id);
		}
		
		service.saveComment(comment, posterUid, sessionU_Id);		
		return "redirect:/PetForum/postDetail.jsp?posterUid="+posterUid+"&u_Id="+sessionU_Id;
	}
	
	
	@RequestMapping("/viewComment")//AJAX把comment帶到postDetail.jsp
	public @ResponseBody List<Object[]> viewComment(			
		    @RequestParam(required = false) Integer posterUid) {
		
		if(posterUid == null) {return null;}
			
		List<Object[]> list = service.getCommentByPosterUid(posterUid);		
		return list;
	}
	
}
