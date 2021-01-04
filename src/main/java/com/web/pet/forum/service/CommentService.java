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
	private CommentDao dao;	
	

	/**
	 * @author ching
	 *	新增一則留言
	 */
	public int saveComment(Comment comment, Integer posterUid, Integer u_Id) {//新增一則留言

		return dao.saveComment(comment, posterUid, u_Id);
	}	
	
	public List<Comment> getAllComments(String hql) {//依hql條件取得所有留言			
		 List<Comment> list = dao.getAllComments(hql);		
		return list;
	}	

	public Comment getComment(Integer commentId) {//取得一則留言		
		 Comment comment = dao.getComment(commentId);
		return comment;		
	}
	
	public int modifyComment(Comment comment) {//修改留言
		return dao.modifyComment(comment);
	}
	
	public List<Object[]> getCommentByPosterUid(Integer posterUid){//按posterUid找留言
		List<Object[]> list = dao.getCommentByPosterUid(posterUid);
		return list;
	}
	

	
}
