package com.web.pet.forum.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.forum.model.ArticleFavorite;





@Repository
public class ArticleLikeDao {
	
	@Autowired
	private SessionFactory sessionFactory;	
	
	
	public int saveArticleLike(ArticleFavorite articleLike) {
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		session.save(articleLike);
		count++;
		return count;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<ArticleFavorite> getAllArticleLikes(String hql) {
		
		List<ArticleFavorite> list = new ArrayList<ArticleFavorite>();
		//hql = "FROM ArticleLikeDao";// 不是表格名稱是類別名稱
		Session session = sessionFactory.getCurrentSession();
		 Query<ArticleFavorite> query = session.createQuery(hql);
		list = query.getResultList();
		
		return list;
	}


	public ArticleFavorite getArticleLike(Integer likeId) {		
		
		Session session = sessionFactory.getCurrentSession();
		ArticleFavorite articleLike = session.get(ArticleFavorite.class, likeId);
		return articleLike;
	}
	
	public List<ArticleFavorite> getArticleLikeBy2Uid(Integer u_Id, Integer posterUid){//按u_Id,posterUid找收藏
		List<ArticleFavorite> list = new ArrayList<ArticleFavorite>();
		Session session=sessionFactory.getCurrentSession();
		String hql = "FROM ArticleLike where u_Id = :u_Id and posterUid = :posterUid";
		Query<ArticleFavorite> query = session.createQuery(hql).setParameter("u_Id", u_Id).setParameter("posterUid", posterUid);
		list=query.getResultList();
		
		if(list.isEmpty()) {return null;}		
		else {return list;}
		
	}
	
	public int removeArticleLike(ArticleFavorite articleLike) { //移除收藏
		int count =0;
		Session session = sessionFactory.getCurrentSession();
		session.delete(articleLike);
		count++;
		return count;
	}

}
