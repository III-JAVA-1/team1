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
	
	
	@SuppressWarnings("unchecked")
	public List<Article> getAllArticles(String hql) {
		
		List<Article> list = new ArrayList<Article>();
		//String hql = "select A.header,A.content FROM Article A";不是表格名稱是類別名稱
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
	
	@SuppressWarnings("unchecked")
	public ListWithPaging getArticleByForumId(String forumId, Integer page){//按forumId找文章
		
		ListWithPaging res = new ListWithPaging();
		
		List<Object> list = new ArrayList<Object>();
		Session session = sessionFactory.getCurrentSession();
		String sql = "";		
		
		if(forumId.equals("全部")) {
			System.out.println("123");
			sql = "select Article.header, Article.reply, Article.viewing, Member.sname, Article.updatedTime, Article.posterUid, Member.u_Id\n" + 
				  "from Article, Member\n" + 
				  "where Article.u_Id = Member.u_Id\n" + 
				  "order by Article.updatedTime desc";
			
			list = session.createNativeQuery(sql)									
									.setFirstResult(10*(page-1))
									.setMaxResults(10)
									.getResultList();			
			res.setArticleList(list);//將文章集合加入ListWithPaging物件
			
			@SuppressWarnings("rawtypes")
			Query query = session.createQuery(
					"select count(*)\r\n" + 
					"from Article");			
			Long total1 = (Long)query.uniqueResult();
			Double totalCounts = total1.doubleValue();		
			double total2 = totalCounts / 10.0;
			System.out.println(total2);
			Integer totalPages =  (int) Math.ceil(total2);
			System.out.println("=======totalPages"+totalPages);	
			
			System.out.println("totalPages"+totalPages);			
			res.setTotalPages(totalPages);//將totalPages加入ListWithPaging物件
			res.setTotalCounts(totalCounts.intValue());
				
		}
		else {
			System.out.println("456");
			sql = "select Article.header, Article.reply, Article.viewing, Member.sname, Article.updatedTime, Article.posterUid, Member.u_Id\r\n" + 
					"from Article, Member\r\n" + 
					"where Article.forumId = :forumId\r\n" +
					"and Article.u_Id = Member.u_Id\n" + 
					"order by Article.updatedTime desc";			
			
			list = session.createNativeQuery(sql)
					.setParameter("forumId", forumId)
					.setFirstResult(10*(page-1))
					.setMaxResults(10)
					.getResultList();
			res.setArticleList(list);//將文章集合加入ListWithPaging物件
			System.out.println("list==null"+list.isEmpty());
			
			
			Object total1 = session.createSQLQuery(
					"select count(*) from Article where Article.forumId= :forumId")
					.setParameter("forumId", forumId).uniqueResult();
			
			Integer totalCounts = (Integer)total1;			
			double total2 = totalCounts / 10.0;			
			Integer totalPages =  (int) Math.ceil(total2);	
			res.setTotalPages(totalPages);//將totalPages加入ListWithPaging物件
			res.setTotalCounts(totalCounts);
		}
		
		if(list.isEmpty()) {return null;}		
		else {return res;}
		
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Object[]> getArticleByFavoriteId(Integer favoriteId){//按favoriteId找文章
		
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
		list = session.createNativeQuery(sql).setParameter("favoriteId", favoriteId).getResultList();
		
		if(list.isEmpty()) {return null;}
		else {return list;}		
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<Object[]> getArticleBy2Uid(Integer u_Id, Integer posterUid){//按2Uid找文章
		
		List<Object[]> list = new ArrayList<Object[]>();		
		Session session = sessionFactory.getCurrentSession();
		String sql = "";
		
		sql = "select m.u_Id,m.sname,a.header,a.updatedTime,a.viewing,a.content,a.posterUid\r\n" + 
				"from Article a\r\n" + 
				"join Member m\r\n" + 
				"on m.u_Id = a.u_Id\r\n" + 
				"where a.posterUid = :posterUid";			
		list = session.createNativeQuery(sql).setParameter("posterUid", posterUid).getResultList();

		if(list.isEmpty()) {return null;}
		else {return list;}				
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Article> getArticleByPosterUid(Integer posterUid){//按posterUid找文章
		List<Article> list = new ArrayList<Article>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "";
		hql = "FROM Article a where a.posterUid = :posterUid";
		Query<Article> query = session.createQuery(hql).setParameter("posterUid", posterUid);
		list = query.getResultList();
		return list;
	}
	
		
	@SuppressWarnings("unchecked")
	public List<Article> getArticleByHeaderKey(String inputText){//按關鍵字找文章
		List<Article> list = new ArrayList<Article>();
		Session session=sessionFactory.getCurrentSession();
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
		list = session.createNativeQuery(sql)				
				.setFirstResult(10*(page-1))
				.setMaxResults(10)
				.getResultList();
		res.setArticleList(list);//將文章集合加入ListWithPaging物件
		System.out.println("list==null"+list.isEmpty());
		
		//計算總頁數
		Object total1 = session.createSQLQuery(
				"select count(*) FROM Article a where a.header like"+ inputText)
				.uniqueResult();
		
		Integer totalCounts = (Integer)total1;			
		double total2 = totalCounts / 10.0;			
		Integer totalPages =  (int) Math.ceil(total2);	
		
		res.setTotalPages(totalPages);//將totalPages加入ListWithPaging物件
		res.setTotalCounts(totalCounts);
		
		if(list.isEmpty()) {return null;}		
		else {return res;}
	}
	
	
	/**
	 * @author ching
	 *	按關鍵字找文章
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
		list = session.createSQLQuery(sql)				
				.setFirstResult(10*(page-1))
				.setMaxResults(10)
				.getResultList();
		res.setArticleList(list);//將文章集合加入ListWithPaging物件
		System.out.println("list==null"+list.isEmpty());
		
		//計算總頁數
		Object total1 = session.createSQLQuery(
				"select count(*)\r\n" + 
				"from Article\r\n" + 
				"join Member\r\n" + 
				"on Article.u_Id = Member.u_Id\r\n" + 
				"join Comment\r\n" + 
				"on Article.posterUid = Comment.posterUid").uniqueResult();
		
		Integer totalCounts = (Integer)total1;			
		double total2 = totalCounts / 10.0;			
		Integer totalPages =  (int) Math.ceil(total2);	
		
		res.setTotalPages(totalPages);//將totalPages加入ListWithPaging物件
		res.setTotalCounts(totalCounts);
		
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
	
	
	/**
	 * @author ching
	 *	修改文章需要merge
	 */
	public int modifyArticle(Article article, Integer u_Id) { 
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		article.setMember(session.get(Member.class,u_Id));
		session.merge(article);
		count++;
		return count;
	}
	
	
	public int increaseViewing(Article article) {//增加瀏覽率
		int count = 0;
		Session session = sessionFactory.getCurrentSession();		
		session.merge(article);
		count++;
		return count;
	}
	
	public int deleteArticle(Article article) { //刪除文章
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		session.delete(article);
		count++;
		return count;
	}

}
