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
	
	public int saveArticle(Article article,Integer u_Id) {//新增一篇文章
		return dao.saveArticle(article,u_Id);
	}	
	
	public List<Article> getAllArticles(String hql) {//依hql條件取得所有文章			
		 List<Article> list = dao.getAllArticles(hql);		
		return list;
	}	
	
	public List<Object[]> getArticleByFavoriteId(Integer favoriteId){//按favoriteId找文章
		List<Object[]> list = dao.getArticleByFavoriteId(favoriteId);		
		return list;
	}	
	
	public List<Article> getArticleByPosterUid(Integer posterUid){//按posterUid找文章
		List<Article> list = dao.getArticleByPosterUid(posterUid);
		return list;
	}
	
	public List<Object[]> getArticleBy2Uid(Integer u_Id, Integer posterUid){//按favoriteId找文章
		List<Object[]> list = dao.getArticleBy2Uid(u_Id, posterUid);		
		return list;
	}
	
	public Article getArticle(Integer posterUid) {//取得一篇文章		
		Article article = dao.getArticle(posterUid);
		return article;		
	}
	
	public int modifyArticle(Article article,Integer u_Id) {//修改文章
		return dao.modifyArticle(article, u_Id);
	}
	
	public ListWithPaging getArticleByForumId(String forumId, Integer page){//按forumId找文章
		ListWithPaging res = dao.getArticleByForumId(forumId, page);
		return res;
	}
	
	public ListWithPaging getArticleByHeaderKey(String inputText, Integer page){//按關鍵字找文章
		ListWithPaging list = dao.getArticleByHeaderKey(inputText, page);
		return list;
	}
	
	public ListWithPaging getArticleByLatestComment(Integer page){	
		ListWithPaging list = dao.getArticleByLatestComment(page);
		return list;
	}
	
	public int updateArticle(Article article) {	
		return dao.updateArticle(article);
	}
	
	public int deleteArticle(Article article) { //刪除文章
		return dao.deleteArticle(article); 
	}
	
	public int setCommentCounts(Article article) {
		return dao.setCommentCounts(article);
	}
	
}
