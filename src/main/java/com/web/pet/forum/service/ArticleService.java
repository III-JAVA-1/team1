package com.web.pet.forum.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;


import com.web.pet.forum.dao.ArticleDao;
import com.web.pet.forum.model.Article;

@EnableTransactionManagement
@Transactional
@Service
public class ArticleService {
	
	@Autowired
	ArticleDao dao;	
	
	public int saveArticle(Article article,Integer id) {//新增一篇文章
		return dao.saveArticle(article,id);
	}	
	
	public List<Article> getAllArticles(String hql) {//依hql條件取得所有文章			
		 List<Article> list = dao.getAllArticles(hql);		
		return list;
	}	

	public Article getArticle(Integer posterUid) {//取得一篇文章		
		 Article article = dao.getArticle(posterUid);
		return article;		
	}
	
	public int modifyArticle(Article article) {//修改文章
		return dao.modifyArticle(article);
	}
	
	public List<Article> getArticleByForumId(String forumId){//按forumId找文章
		List<Article> list = dao.getArticleByForumId(forumId);
		return list;
	}
	
	public List<Article> getArticleByHeaderKey(String inputText){//按關鍵字找文章
		List<Article> list = dao.getArticleByHeaderKey(inputText);
		return list;
	}
	

	
}
