package com.web.pet.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.pet.forum.model.Article;
import com.web.pet.forum.service.ArticleService;
import com.web.pet.member.service.MemberService;


@RequestMapping("/petforum")
@Controller
public class ArticleCRUD{
	
	@Autowired
	ArticleService service;
	@Autowired
	MemberService mbService;
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	
	@RequestMapping("/selectForum")//按不同討論區找文章 -  click a標籤
	@ResponseBody
	public List<Article> selectForum(String forumId){		
		
		List<Article> list = service.getArticleByForumId(forumId);		
		return list;
	}
	
	@RequestMapping("/selectAll")//網頁開啟加載所有文章 - $().ready
	@ResponseBody
	public List<Article> selectAll(@RequestParam(value = "forumId",required = false) String forumId){		
		List<Article> list = service.getArticleByForumId(forumId);		
		return list;
	}	
	
	
	@ResponseBody
	@GetMapping("/selectHeader")//按關鍵字找文章
	public List<Article> selectHeader(@RequestParam("inputText") String inputText) {		
		List<Article> list = service.getArticleByHeaderKey(inputText);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/viewPost")//把article帶到postDetail.jsp
	public List<Article> viewPost(HttpServletRequest request,@RequestParam Integer posterUid) {
		request.getParameter("posterUid");
		if(posterUid==null) {
			return null;
		}
		System.out.println("===="+posterUid);
		List<Article> list = new LinkedList<Article>();
		Article article = service.getArticle(posterUid);
		list.add(article);
		
		return list;
	}
	
	@RequestMapping("/modify")//準備修改文章
	public ModelAndView editPost(Integer posterUid) {
		
		Article article = service.getArticle(posterUid);
		ModelAndView mv = new ModelAndView();
		mv.addObject("articleModel", article);	
		mv.setViewName("forward:/PetForum/edit.jsp");
	
		return mv;
	}
	
	@RequestMapping("/newArticle")//準備發表新文章
	public ModelAndView newPost() {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("articleModel", new Article());
		mv.setViewName("forward:/PetForum/editArticle.jsp");
		
		return mv;
	}
	
	@RequestMapping("/previewPost")//預覽文章(AJAX)
	public ModelAndView previewPost(
			Integer posterUid,
			Article article) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forward:/PetForum/preview.jsp");
		mv.addObject("articleModel", article);		
		
		return mv;
	}
	
	@RequestMapping("/commitEdit")
	public String commitEdit(
			@RequestParam("preview")String preview,
			Article article,
			HttpServletResponse response) throws IOException {
			PrintWriter out = response.getWriter();
		
			if("確定修改".equals(preview)) {
				int count = service.saveArticle(article);				
				if(count > 0) {					
					out.print("<script>");
					out.print("window.alert('文章修改成功');");
					out.print("</script>");
					}
			}
			else if("新增".equals(preview)) {
				int count = service.saveArticle(article);
				if(count > 0) {					
					out.print("<script>");
					out.print("window.alert('文章新增成功');");
					out.print("</script>");
					}
			}		
		
		return "redirect:/PetForum/lookforPet.jsp";
	}
	
 }
	
	 
	 
	
	

	

