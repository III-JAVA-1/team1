package com.web.pet.forum.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.web.pet.forum.model.Article;
import com.web.pet.forum.model.ListWithPaging;
import com.web.pet.member.model.Member;


/**
 *  Class Name: ArticleDao.java
 *  Description: 
 *  @author ching  DateTime 2021/1/14 下午 01:20:45 
 *  @company 
 *  @email public192021@gmail.com
 *  @version 1.0
 */
@Repository
public class ArticleDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public int saveArticle(Article article,Integer u_Id) {
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		//Article表與Member表關聯，是透過member這個屬性欄位，
		//所以可以透過Controller在session取得Member表的主鍵
		//獲取特定的Member紀錄
		article.setMember(session.get(Member.class,u_Id));
		session.save(article);
		count++;
		return count;
	}

	public Article getArticle(Integer posterUid) {		
		
		Session session = sessionFactory.getCurrentSession();
		Article article = session.get(Article.class, posterUid);
		return article;
	}
	

	/**
	 *  Description: 按forumId找文章
	 *  @author ching  DateTime 2021/1/14 下午 01:21:03
	 *  @param forumId
	 *  @param page
	 *  @return
	 */
	@SuppressWarnings("unchecked")
	public ListWithPaging getArticleByForumId(String forumId, Integer page){	
		
		ListWithPaging res = new ListWithPaging();		
		List<Object> list = new ArrayList<Object>();
		String sql = "";
		Session session = sessionFactory.getCurrentSession();
		if(forumId.equals("全部")) {		
			sql = "select Article.header, Article.reply, Article.viewing, Member.sname, Article.updatedTime, Article.posterUid, Member.u_Id\n" + 
				  "from Article, Member\n" + 
				  "where Article.u_Id = Member.u_Id\n" + 
				  "order by Article.updatedTime desc";
			
			//分頁
			list = this.getPagination(sql, page);			
			res.setArticleList(list);//將文章集合加入ListWithPaging物件
			
			//計算總頁數	
			Object total1 = session.createSQLQuery(
					"select count(*)\r\n" + 
					"from Article").uniqueResult();
			
			Integer[] totals = this.getTotals(total1);		
			res.setTotalCounts(totals[0]);
			res.setTotalPages(totals[1]);//將totalPages加入ListWithPaging物件		
				
		}
		else {			
			sql = "select Article.header, Article.reply, Article.viewing, Member.sname, Article.updatedTime, Article.posterUid, Member.u_Id\r\n" + 
					"from Article, Member\r\n" + 
					"where Article.forumId = :forumId\r\n" +
					"and Article.u_Id = Member.u_Id\n" + 
					"order by Article.updatedTime desc";			
			//分頁
			list = session.createNativeQuery(sql)
					.setParameter("forumId", forumId)
					.setFirstResult(10*(page-1))
					.setMaxResults(10)
					.getResultList();
			res.setArticleList(list);//將文章集合加入ListWithPaging物件	
			
			//計算總頁數
			Object total1 = session.createSQLQuery(
					"select count(*) from Article where Article.forumId= :forumId")
					.setParameter("forumId", forumId).uniqueResult();
			
			Integer[] totals = this.getTotals(total1);		
			res.setTotalCounts(totals[0]);
			res.setTotalPages(totals[1]);//將totalPages加入ListWithPaging物件
			
		}
		
		if(list.isEmpty()) {return null;}		
		else {return res;}
		
	}
	

	/**
	 *  Description: 按favoriteId找文章
	 *  @author ching  DateTime 2021/1/14 下午 01:21:18
	 *  @param favoriteId
	 *  @return
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> getArticleByFavoriteId(Integer favoriteId){
		
		if(favoriteId == null) {return null;}
		List<Object[]> list = new ArrayList<Object[]>();		
		Session session = sessionFactory.getCurrentSession();
		String sql = "";
		
		sql = "select m.u_Id,m.sname,a.header,a.updatedTime,a.viewing,a.content,a.posterUid, af.favoriteId\r\n" + 
				"from Article a\r\n" + 
				"join Member m\r\n" + 
				"on m.u_Id = a.u_Id\r\n" + 
				"join ArticleFavorite af\r\n" + 
				"on af.posterUid = a.posterUid\r\n" + 
				"where af.favoriteId = :favoriteId";
		list = session.createNativeQuery(sql)
					  .setParameter("favoriteId", favoriteId)
					  .getResultList();
		
		if(list.isEmpty()) {return null;}
		else {return list;}		
	}
	

	/**
	 *  Description: 按2Uid找文章
	 *  @author ching  DateTime 2021/1/14 下午 01:21:29
	 *  @param u_Id
	 *  @param posterUid
	 *  @return
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> getArticleBy2Uid(Integer u_Id, Integer posterUid){
		
		List<Object[]> list = new ArrayList<Object[]>();		
		Session session = sessionFactory.getCurrentSession();
		String sql = "";
		
		sql = "select m.u_Id,m.sname,a.header,a.updatedTime,a.viewing,a.content,a.posterUid\r\n" + 
				"from Article a\r\n" + 
				"join Member m\r\n" + 
				"on m.u_Id = a.u_Id\r\n" + 
				"where a.posterUid = :posterUid";			
		list = session.createNativeQuery(sql)
					  .setParameter("posterUid", posterUid)
					  .getResultList();

		if(list.isEmpty()) {return null;}
		else {return list;}				
	}
	

	/**
	 *  Description: 按關鍵字找文章
	 *  @author ching  DateTime 2021/1/14 下午 01:21:55
	 *  @param inputText
	 *  @param page
	 *  @return
	 */
	public ListWithPaging getArticleByHeaderKey(String inputText, Integer page){
		inputText = "'%"+inputText+"%'";
		ListWithPaging res = new ListWithPaging();		
		List<Object> list = new ArrayList<Object>();
		String sql = "";
		Session session = sessionFactory.getCurrentSession();
		sql="select Article.header, Article.reply, Article.viewing, Member.sname, Article.updatedTime, Article.posterUid, Member.u_Id\r\n" + 
			"from Article, Member\r\n" + 
			"where Article.header like"+inputText+"\r\n" + 
			"and Article.u_Id = Member.u_Id\r\n" + 
			"order by Article.updatedTime desc";
		
		//分頁
		list = this.getPagination(sql, page);	
		res.setArticleList(list);//將文章集合加入ListWithPaging物件		
		
		//計算總頁數
		Object total1 = session.createSQLQuery(
				"select count(*) FROM Article a where a.header like"+ inputText)
				.uniqueResult();
		
		Integer[] totals = this.getTotals(total1);		
		res.setTotalCounts(totals[0]);
		res.setTotalPages(totals[1]);//將totalPages加入ListWithPaging物件
		
		if(list.isEmpty()) {return null;}		
		else {return res;}
	}
	
	
	/**
	 *  Description: 按關鍵字找文章
	 *  @author ching  DateTime 2021/1/14 下午 01:22:07
	 *  @param page
	 *  @return
	 */
	@SuppressWarnings("unchecked")
	public ListWithPaging getArticleByLatestComment(Integer page){		
		ListWithPaging res = new ListWithPaging();		
		List<Object> list = new ArrayList<Object>();
		String sql = "";
		Session session = sessionFactory.getCurrentSession();
		sql="select Article.header, Article.reply, Article.viewing, Member.sname, Article.updatedTime, Article.posterUid, Member.u_Id\r\n" + 
			"from Article\r\n" + 
			"join Member\r\n" + 
			"on Article.u_Id = Member.u_Id\r\n" + 
			"join Comment\r\n" + 
			"on Article.posterUid = Comment.posterUid\r\n" + 
			"order by Comment.commentUpdatedTime desc";
		
		//分頁
		list = this.getPagination(sql, page);	
		res.setArticleList(list);//將文章集合加入ListWithPaging物件		
		
		//計算總頁數
		Object total1 = session.createSQLQuery(
				"select count(*)\r\n" + 
				"from Article\r\n" + 
				"join Member\r\n" + 
				"on Article.u_Id = Member.u_Id\r\n" + 
				"join Comment\r\n" + 
				"on Article.posterUid = Comment.posterUid").uniqueResult();
		
		Integer[] totals = this.getTotals(total1);		
		res.setTotalCounts(totals[0]);
		res.setTotalPages(totals[1]);//將totalPages加入ListWithPaging物件
		
		if(list.isEmpty()) {return null;}		
		else {return res;}
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Object[]> getArticleByHighestViewing(){
		List<Object[]> list = new ArrayList<Object[]>();		
		Session session = sessionFactory.getCurrentSession();
		String sql = "";		
		sql = "select top(3) a.posterUid, a.u_Id, a.header, a.content, a.viewing\r\n" + 
			  "from Article a\r\n" + 
			  "order by a.viewing desc";			
		list = session.createNativeQuery(sql).getResultList();
		
		if(list.isEmpty()) {return null;}
		else {return list;}				
	}	
	
	
	@SuppressWarnings("unchecked")
	public List<Article> randomArticle(){
		Session session = sessionFactory.getCurrentSession();
		List<Article> list = new ArrayList<Article>();
		String hql="select top 5 a.posterUid, a.u_Id, a.header, a.content\r\n" + 
				"from Article a\r\n" + 
				"ORDER BY NEWID()";
		Query<Article> query = session.createSQLQuery(hql);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	

	/**
	 *  Description: 修改文章需要merge
	 *  @author ching  DateTime 2021/1/14 下午 01:22:29
	 *  @param article
	 *  @param u_Id
	 *  @return
	 */
	public int modifyArticle(Article article, Integer u_Id) { 
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		article.setMember(session.get(Member.class,u_Id));		
		session.merge(article);
		count++;
		return count;
	}
	
	/**
	 *  Description: 整合分頁設定
	 *  @author ching  DateTime 2021/1/14 下午 03:13:47
	 *  @param sql
	 *  @param page
	 *  @return
	 */
	@SuppressWarnings("unchecked")
	public List<Object> getPagination(String sql, Integer page){
		Session session = sessionFactory.getCurrentSession();
		List<Object> list = session.createSQLQuery(sql)				
		.setFirstResult(10*(page-1))
		.setMaxResults(10)
		.getResultList();
		
		return list;
	}
	
	
	
	
	/**
	 *  Description: 計算總比數與總頁數
	 *  @author ching  DateTime 2021/1/14 下午 03:14:02
	 *  @param total1
	 *  @return
	 */
	public Integer[] getTotals(Object total1) {
		Integer totalCounts = (Integer)total1;			
		double total2 = totalCounts / 10.0;			
		Integer totalPages =  (int) Math.ceil(total2);
		Integer[] totals = {totalCounts, totalPages};
		
		return totals;
	}

}
