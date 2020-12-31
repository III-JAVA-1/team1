package com.web.pet.forum.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.forum.model.Article;
import com.web.pet.forum.model.Comment;
import com.web.pet.member.model.Member;




/**
 * @author ching
 *
 */
@Repository
public class CommentDao {
	
	@Autowired
	private SessionFactory sessionFactory;	
	
	
	public int saveComment(Comment comment, Integer posterUid, Integer u_Id) {
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		comment.setArticle(session.get(Article.class, posterUid));
		comment.setMember(session.get(Member.class, u_Id));
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
	
	@SuppressWarnings("unchecked")
	public List<Object[]> getCommentByPosterUid(Integer posterUid){//按posterUid找留言
		List<Object[]> list = new ArrayList<Object[]>();
		Session session=sessionFactory.getCurrentSession();
		String sql = "select Member.u_Id,Member.sname,Comment.commentContent,Comment.commentUpdatedtime\r\n" + 
					 "from Comment\r\n" + 
					 "join Member\r\n" + 
					 "on Comment.u_Id = Member.u_Id\r\n" + 
					 "join Article\r\n" + 
					 "on Comment.posterUid = Article.posterUid\r\n" + 
					 "where Article.posterUid=:posterUid\r\n"+
					 "order by Comment.commentUpdatedtime";
		list = session.createNativeQuery(sql).setParameter("posterUid", posterUid).getResultList();
		
		if(list.isEmpty()) {return null;}		
		else {return list;}
		
	}
	
	/**
	 * @author ching
	 *	修改留言需要merge
	 */
	public int modifyComment(Comment comment) {
		int count =0;
		Session session = sessionFactory.getCurrentSession();
		session.merge(comment);
		count++;
		return count;
	}

}
