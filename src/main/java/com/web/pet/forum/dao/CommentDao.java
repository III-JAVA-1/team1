package com.web.pet.forum.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.web.pet.forum.model.Comment;


@Repository
public class CommentDao {
	
	@Autowired
	private SessionFactory sessionFactory;	
	
	
	public int saveComment(Comment comment) {
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		session.save(comment);
		count++;
		return count;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Comment> getAllComments(String hql) {
		
		List<Comment> list = new ArrayList<Comment>();
		//hql = "FROM Comment";// 不是表格名稱是類別名稱
		Session session = sessionFactory.getCurrentSession();
		 Query<Comment> query = session.createQuery(hql);
		list = query.getResultList();
		
		return list;
	}


	public Comment getComment(Integer commentId) {		
		
		Session session = sessionFactory.getCurrentSession();
		Comment comment = session.get(Comment.class, commentId);
		return comment;
	}
	
	public List<Comment> getCommentByPosterUid(String posterUid){//按posterUid找留言
		List<Comment> list = new ArrayList<Comment>();
		Session session=sessionFactory.getCurrentSession();
		String hql = "SELECT Article a INNER JOIN Comment c"
				+ "ON a.posterUid = c.article.posterUid"
				+ "where a.posterUid = :posterUid";
		Query<Comment> query = session.createQuery(hql).setParameter("posterUid", posterUid);
		list=query.getResultList();
		
		if(list.isEmpty()) {return null;}		
		else {return list;}
		
	}
	
	public int modifyComment(Comment comment) { //修改留言需要merge
		int count =0;
		Session session = sessionFactory.getCurrentSession();
		session.merge(comment);
		count++;
		return count;
	}

}
