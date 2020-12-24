package com.web.pet.forum.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.pet.forum.dao.ArticleDao;
import com.web.pet.forum.model.Article;

@EnableTransactionManagement
@Transactional
@Service
public class ArticleService {
	
	@Autowired
	ArticleDao dao;	
	
	public int saveArticle(Article article,Integer u_Id) {//新增一篇文章
		return dao.saveArticle(article,u_Id);
	}	
	
	public List<Article> getAllArticles(String hql) {//依hql條件取得所有文章			
		 List<Article> list = dao.getAllArticles(hql);		
		return list;
	}	
	
	
	
	public List<Object[]> getArticleByPosterUid(Integer posterUid){//按posterUid找文章
		List<Object[]> list = dao.getArticleByPosterUid(posterUid);		
		return list;
	}
	

	public Article getArticle(Integer posterUid) {//取得一篇文章		
		Article article = dao.getArticle(posterUid);
		return article;		
	}
	
	public int modifyArticle(Article article,Integer u_Id) {//修改文章
		return dao.modifyArticle(article, u_Id);
	}
	
	public List<Article> getArticleByForumId(String forumId){//按forumId找文章
		List<Article> list = dao.getArticleByForumId(forumId);
		return list;
	}
	
	public List<Article> getArticleByHeaderKey(String inputText){//按關鍵字找文章
		List<Article> list = dao.getArticleByHeaderKey(inputText);
		return list;
	}
	
	public int deleteArticle(Article article) { //刪除文章
		return dao.deleteArticle(article); 
	}
	
}
