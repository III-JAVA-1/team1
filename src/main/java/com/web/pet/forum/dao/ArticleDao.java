package com.web.pet.forum.dao;



import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.pet.forum.model.Article;
import com.web.pet.member.model.Member;


@Repository
public class ArticleDao {
	
	@Autowired
	private SessionFactory sessionFactory;	
	
	
	public int saveArticle(Article article,Integer id) {
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		//session.get(Member.class,1);
		article.setMember(session.get(Member.class,id));
		session.save(article);
		count++;
		return count;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Article> getAllArticles(String hql) {
		
		List<Article> list = new LinkedList<Article>();
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
	public List<Article> getArticleByForumId(
			@RequestParam(value = "forumId", required = false)String forumId
			){//按forumId找文章
		List<Article> list = new LinkedList<Article>();
		Session session=sessionFactory.getCurrentSession();
		String sql = "";		
		
		if(forumId.equals("全部")) {
			System.out.println("123");
			sql = "select Article.header, Article.reply, Article.viewing, Member.sname, Article.updatedTime, Article.posterUid\n" + 
				  "from Article, Member\n" + 
				  "where Article.u_Id = Member.u_Id\n" + 
				  "order by Article.updatedTime desc";
			list = session.createNativeQuery(sql).getResultList();
		}
		else {
			
			sql = "select Article.header, Article.reply, Article.viewing, Member.sname, Article.updatedTime, Article.posterUid\r\n" + 
					"from Article, Member\r\n" + 
					"where Article.forumId = :forumId\r\n" + 
					"order by Article.updatedTime desc";	
			list = session.createNativeQuery(sql).setParameter("forumId", forumId).getResultList();
		}				
		
		
		if(list.isEmpty()) {return null;}		
		else {return list;}
		
	}
	
	public List<Article> getArticleByHeaderKey(String inputText){//按關鍵字找文章
		List<Article> list = new LinkedList<Article>();
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
