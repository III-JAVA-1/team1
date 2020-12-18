package com.web.pet.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.pet.member.model.Member;
import com.web.pet.member.service.MemberService;

import javassist.expr.NewArray;

import com.web.pet.forum.model.Article;
import com.web.pet.forum.service.ArticleService;


@RequestMapping("/petforum")
@Controller
public class ArticleCRUD{
	
	@Autowired
	ArticleService service;
	@Autowired
	MemberService mbService;
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	
	@GetMapping("/selectForum")//按不同討論區找文章
	public ModelAndView selectForum(String forumKey){		
		 
		String forumId = "";
		switch (forumKey) {
		
		case "lookfor":
			forumId = "協尋";
			break;
		case "adopt":
			forumId = "送養";
			break;
		case "life":
			forumId = "日常";
			break;
		case "topic":
			forumId = "主題";
			break;
		case "friend":
			forumId = "徵友";
			break;		
		case "share":
			forumId = "心得";
			break;
		}
		ModelAndView mv = new ModelAndView();
		List<Article> list = service.getArticleByForumId(forumId);
		System.out.println(Arrays.asList(list));
		mv.addObject("articles",list);
		mv.setViewName("forward:/PetForum/forum.jsp");
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/selectHeader")//按關鍵字找文章
	public List<Article> selectHeader(@RequestParam("inputText") String inputText) {		
		List<Article> list = service.getArticleByHeaderKey(inputText);
		
		return list;
	}
	
	@RequestMapping("/viewPost")//把article帶到postDetail.jsp
	public ModelAndView viewPost(Integer posterUid) {	
		
		Article article = service.getArticle(posterUid);
		ModelAndView mv = new ModelAndView();
		mv.addObject("article", article);		
		mv.setViewName("forward:/PetForum/postDetail.jsp");
		
		return mv;
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
	
	 
	 
	
	

	

