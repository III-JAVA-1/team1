package com.web.pet.forum.service;


import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.pet.forum.dao.ArticleDao;
import com.web.pet.forum.model.Article;
import com.web.pet.forum.model.ListWithPaging;



@EnableTransactionManagement
@Transactional
@Service
public class ArticleService {
	
	@Autowired
	private ArticleDao dao;	
	
	public int saveArticle(Article article,Integer u_Id) {
		return dao.saveArticle(article,u_Id);
	}	
	
	
	public List<Object[]> getArticleByFavoriteId(Integer favoriteId){
		List<Object[]> list = dao.getArticleByFavoriteId(favoriteId);		
		return list;
	}	
	
		
	public List<Object[]> getArticleBy2Uid(Integer u_Id, Integer posterUid){
		List<Object[]> list = dao.getArticleBy2Uid(u_Id, posterUid);		
		return list;
	}
	
	public Article getArticle(Integer posterUid) {		
		Article article = dao.getArticle(posterUid);
		return article;		
	}
	
	public int modifyArticle(Article article,Integer u_Id) {
		return dao.modifyArticle(article, u_Id);
	}
	
	public ListWithPaging getArticleByForumId(String forumId, Integer page){
		ListWithPaging res = dao.getArticleByForumId(forumId, page);
		return res;
	}
	
	public ListWithPaging getArticleByHeaderKey(String inputText, Integer page){
		ListWithPaging list = dao.getArticleByHeaderKey(inputText, page);
		return list;
	}
	
	public ListWithPaging getArticleByLatestComment(Integer page){	
		ListWithPaging list = dao.getArticleByLatestComment(page);
		return list;
	}
	
	public List<Object[]> getArticleByHighestViewing(){
		List<Object[]> list = dao.getArticleByHighestViewing();		
		return list;
	}
	
	public List<Article> randomArticle(){
		List<Article> list = dao.randomArticle();
		return list;
	}
	
		
	public int setCommentCounts(Article article) {
		return dao.setCommentCounts(article);
	}
	
}
