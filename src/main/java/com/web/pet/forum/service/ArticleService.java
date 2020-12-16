package com.web.pet.forum.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.pet.member.model.Member;
import com.web.pet.forum.dao.ArticleDao;
import com.web.pet.forum.model.Article;

@EnableTransactionManagement
@Transactional
@Service
public class ArticleService {
	
	@Autowired
	ArticleDao dao;	
	
	public int saveOrUpdateArticle(Article articleBean) {
		int count =0;
				
			dao.saveOrUpadteArticle(articleBean);
			count++;
		
		return count;
	}	
	
	public List<Article> getAllArticles(String hql) {
		List<Article> list = new ArrayList<Article>();
		
			list = dao.getAllArticles(hql);
			for(Article article: list) {
				System.out.println(article.getHeader());
			}
		
		return list;
	}	

	public Article getArticle(int posterUid) {
		Article articleBean =null;
		
		articleBean = dao.getArticle(posterUid);
		return articleBean;
		
	}

	public int deleteArticle(int posterUid) {
		int count =0;		
		dao.deleteArticle(posterUid);
		count++;
			
		return count;
	}
	
	
	/////////////////////////////////////////////////
	public Member getMember(int U_Id) {
		Member member =null;
		
		member = dao.getMember(U_Id);	

		return member;		
	}
	
	public List<Member> getAllMembers(String hql) {
		List<Member> list = new ArrayList<Member>();		
		
		list = dao.getAllMembers(hql);
		for(Member member: list) {
			System.out.println(member.getName());
		}			
			
		return list;
	}



}
