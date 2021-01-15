package com.web.pet.forum.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.forum.model.Article;
import com.web.pet.forum.model.ArticleFavorite;
import com.web.pet.member.model.Member;


@Repository
public class ArticleFavoriteDao {
	
	@Autowired
	private SessionFactory sessionFactory;	
	
	public int saveArticleFavorite(Integer posterUid, Integer u_Id) {
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		ArticleFavorite articleFavorite = new ArticleFavorite();
		articleFavorite.setArticle(session.get(Article.class, posterUid));
		articleFavorite.setMember(session.get(Member.class, u_Id));
		session.save(articleFavorite);
		count++;
		return count;
	}
	
		
	/**
	 *  Description: 按u_Id,posterUid找收藏
	 *  @author ching  DateTime 2021/1/14 下午 02:26:46
	 *  @param sessionU_Id
	 *  @param posterUid
	 *  @return
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> getArticleFavoriteBy2Uid(Integer sessionU_Id, Integer posterUid){
		List<Object[]> list = new ArrayList<Object[]>();
		Session session=sessionFactory.getCurrentSession();
		String sql = "select af.favoriteId\r\n" + 
					 "from ArticleFavorite af\r\n" + 
					 "join Article a\r\n" + 
					 "on af.posterUid = a.posterUid\r\n" + 
					 "join Member m\r\n" + 
					 "on af.u_Id = m.u_Id\r\n" + 
					 "where m.u_Id = :u_Id and a.posterUid = :posterUid";
		list = session.createNativeQuery(sql).setParameter("u_Id", sessionU_Id).setParameter("posterUid", posterUid).getResultList();
		
		if(list.isEmpty()) {return null;}		
		else {return list;}
		
	}
	
	
	/**
	 *  Description: 移除收藏
	 *  @author ching  DateTime 2021/1/14 下午 02:27:02
	 *  @param posterUid
	 *  @param sessionU_Id
	 *  @return
	 */
	public int removeArticleFavorite(Integer posterUid, Integer sessionU_Id) {
		int count =0;		
		@SuppressWarnings("unused")
		List<ArticleFavorite> list = new ArrayList<ArticleFavorite>();		
		Session session = sessionFactory.getCurrentSession();
		String sql = "delete from ArticleFavorite where posterUid = :posterUid and u_Id = :u_Id";
		
		session.createNativeQuery(sql).setParameter("posterUid", posterUid).setParameter("u_Id", sessionU_Id).executeUpdate();
		count++;
		return count;
	}

}
