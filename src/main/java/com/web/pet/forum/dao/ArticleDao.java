package com.web.pet.forum.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.member.model.Member;
import com.web.pet.forum.model.Article;


@Repository
public class ArticleDao {
	
	@Autowired
	private SessionFactory sessionFactory;	
	
	
	public int saveOrUpadteArticle(Article article) {
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(article);
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


	public Article getArticle(int posterUid) {
		
		Article article =null;
		Session session = sessionFactory.getCurrentSession();
		article = session.get(Article.class, posterUid);
		return article;
	}


	public int deleteArticle(int posterUid) {
		
		int count =0;
		Session session = sessionFactory.getCurrentSession();
		Article article = new Article();
		article.setPosterUid(posterUid);
		session.delete(article);
		count++;
		return count;
	}
	
	
	///////////////////////////////////////////////////////
	public Member getMember(int U_Id) {
		
		Member memberBean =null;
		Session session = sessionFactory.getCurrentSession();
		memberBean = session.get(Member.class, U_Id);
		return memberBean;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Member> getAllMembers(String hql) {
		
		List<Member> list = new ArrayList<Member>();
		
		Session session = sessionFactory.getCurrentSession();	
		Query<Member> query = session.createQuery(hql);		
		list = query.getResultList();
		
		return list;
	}


}
