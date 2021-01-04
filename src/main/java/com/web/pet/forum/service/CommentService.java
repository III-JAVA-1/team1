package com.web.pet.forum.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;


import com.web.pet.forum.dao.CommentDao;
import com.web.pet.forum.model.Comment;

/**
 * @author ching
 *
 */
@EnableTransactionManagement
@Transactional
@Service
public class CommentService {
	
	@Autowired
	CommentDao dao;	
	
	/**
	 * @author ching
	 *	新增一則留言
	 */
	public int saveComment(Comment comment, Integer posterUid, Integer u_Id) {
		return dao.saveComment(comment, posterUid, u_Id);
	}	
	
	/**
	 * @author ching
	 *	依hql條件取得所有留言
	 */
	public List<Comment> getAllComments(String hql) {			
		 List<Comment> list = dao.getAllComments(hql);		
		return list;
	}	
	
	/**
	 * @author ching
	 *	取得一則留言	
	 */
	public Comment getComment(Integer commentId) {	
		 Comment comment = dao.getComment(commentId);
		return comment;		
	}
	
	/**
	 * @author ching
	 *	修改留言
	 */
	public int modifyComment(Comment comment) {
		return dao.modifyComment(comment);
	}
	
	/**
	 * @author ching
	 *	按posterUid找留言
	 */
	public List<Object[]> getCommentByPosterUid(Integer posterUid){
		List<Object[]> list = dao.getCommentByPosterUid(posterUid);
		return list;
	}
	
}
