package com.web.pet.forum.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.web.pet.forum.model.Article;


@Repository
public class ArticleDao {
	
	@Autowired
	private SessionFactory sessionFactory;	
	
	
	public int saveArticle(Article article) {
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		session.save(article);
		count++;
		return count;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Article> getAllArticles(String hql) {
		
		List<Article> list = new ArrayList<Article>();
		//hql = "FROM Article";// 不是表格名稱是類別名稱
		Session session = sessionFactory.getCurrentSession();
		 Query<Article> query = session.createQuery(hql);
		list = query.getResultList();
		
		return list;
	}


	public Article getArticle(Integer posterUid) {		
		
		Session session = sessionFactory.getCurrentSession();
		Article article = session.get(Article.class, posterUid);
		return article;
	}
	
	public List<Article> getArticleByForumId(String forumId){//按forumId找文章
		List<Article> list = new ArrayList<Article>();
		Session session=sessionFactory.getCurrentSession();
		String hql = "SELECT m.sname,a.header,a.reply,a.viewing,a.updatedTime"
				+ "FROM Member m INNER JOIN Article a ON m.u_Id = a.member.u_Id"
				+ "WHERE a.forumId = :forumId";
		Query<Article> query = session.createQuery(hql).setParameter("forumId", forumId);
		list=query.getResultList();
		
		if(list.isEmpty()) {return null;}		
		else {return list;}
		
	}
	
	public List<Article> getArticleByHeaderKey(String inputText){//按關鍵字找文章
		List<Article> list = new ArrayList<Article>();
		Session session=sessionFactory.getCurrentSession();
		inputText = "'%"+inputText+"%'";
		String hql = "FROM Article a where a.header like" + inputText;
		Query<Article> query = session.createQuery(hql);
		list=query.getResultList();
		
		if(list.isEmpty()) {return null;}		
		else {return list;}
		
	}
	
	public int modifyArticle(Article article) { //修改文章需要merge
		int count =0;
		Session session = sessionFactory.getCurrentSession();
		session.merge(article);
		count++;
		return count;
	}

}
