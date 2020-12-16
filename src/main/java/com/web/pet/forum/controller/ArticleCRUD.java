package com.web.pet.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.pet.member.model.Member;

import javassist.expr.NewArray;

import com.web.pet.forum.model.Article;
import com.web.pet.forum.service.ArticleService;


@RequestMapping("/petforum")
@Controller
public class ArticleCRUD extends HttpServlet {
	
	@Autowired
	ArticleService service;
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	@RequestMapping("/selectForum/{forumId}")//按不同討論區找文章
	public ModelAndView selectForum(@PathVariable("forumId") String forumId){		
		
		String hql = "";
		switch (forumId) {
		
		case "lookfor":
			hql = "FROM Article a where a.forumId like '%協尋%'";
			break;
		case "adopt":
			hql = "FROM Article a where a.forumId like '%送養%'";
			break;
		case "life":
			hql = "FROM Article a where a.forumId like '%日常%'";
			break;
		case "friend":
			hql = "FROM Article a where a.forumId like '%徵友%'";
			break;
		case "easyTalk":
			hql = "FROM Article a where a.forumId like '%閒聊%'";
			break;
		case "share":
			hql = "FROM Article a where a.forumId like '%心得%'";
			break;
		case "topic":
			hql = "FROM Article a where a.forumId like '%主題%'";
			break;

		default:
			hql = "FROM Article";
			break;
		}
		List<Article> list = service.getAllArticles(hql);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forward:/PetForum/lookforPet.jsp");
		mv.addObject("selectForum",list);			

		return mv;
	}
	
	@RequestMapping("/selectHeader")//按關鍵字找文章
	public ModelAndView selectHeader(@RequestParam("inputText") String inputText) {
		
		inputText = "'%"+inputText+"%'";
		String hql = "FROM Article a where a.header like" + inputText;
		System.out.println(hql);
		List<Article> list = service.getAllArticles(hql);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forward:/PetForum/lookforPet.jsp");
		mv.addObject("selectHeader",list);
		
		return mv;
	}
	
	@RequestMapping("/viewPost/{posterUid}")//把article帶到postDetail.jsp
	public ModelAndView viewPost(@PathVariable("posterUid")Integer posterUid) {		
		
		Article article = service.getArticle(posterUid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forward:/PetForum/postDetail.jsp");
		mv.addObject("article", article);		
		
		return mv;
	}
	
	@RequestMapping("/edit/{posterUid}")//準備修改文章
	public ModelAndView editPost(@PathVariable("posterUid")Integer posterUid) {
		
		Article article = service.getArticle(posterUid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forward:/PetForum/edit.jsp");
		mv.addObject("articleModel", article);	
	
		return mv;
	}
	
	@RequestMapping("/newArticle")//準備發表新文章
	public ModelAndView newPost() {
		
		Article article = new Article();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forward:/PetForum/editArticle.jsp");
		mv.addObject("articleModel", article);
		
		return mv;
	}
	
	@RequestMapping(value={"/previewPost","/previewPost/{posterUid}"})//預覽文章
	public ModelAndView previewPost(
			@PathVariable(value="posterUid",required = false)Integer posterUid,
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
				int count = service.saveOrUpdateArticle(article);				
				if(count > 0) {					
					out.print("<script>");
					out.print("window.alert('文章修改成功');");
					out.print("</script>");
					}
			}
			else if("新增".equals(preview)) {
				int count = service.saveOrUpdateArticle(article);
				if(count > 0) {					
					out.print("<script>");
					out.print("window.alert('文章新增成功');");
					out.print("</script>");
					}
			}		
		
		return "redirect:/PetForum/lookforPet.jsp";
	}
	
 }
	
	 
	 
	
	

	

