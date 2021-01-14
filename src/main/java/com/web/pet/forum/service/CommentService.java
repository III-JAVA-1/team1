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
	 *  Description: 新增一則留言
	 *  @author ching  DateTime 2021/1/14 下午 01:36:42
	 *  @param comment
	 *  @param posterUid
	 *  @param u_Id
	 *  @return
	 */
	public int saveComment(Comment comment, Integer posterUid, Integer u_Id) {		
		
		return dao.saveComment(comment, posterUid, u_Id);
	}	
	

	/**
	 *  Description: 依hql條件取得所有留言
	 *  @author ching  DateTime 2021/1/14 下午 01:37:00
	 *  @param hql
	 *  @return
	 */
	public List<Comment> getAllComments(String hql) {			
		 List<Comment> list = dao.getAllComments(hql);		
		return list;
	}	
	

	/**
	 *  Description: 取得一則留言
	 *  @author ching  DateTime 2021/1/14 下午 01:37:13
	 *  @param commentId
	 *  @return
	 */
	public Comment getComment(Integer commentId) {	
		 Comment comment = dao.getComment(commentId);
		return comment;		
	}	

	

	/**
	 *  Description: 按posterUid找留言
	 *  @author ching  DateTime 2021/1/14 下午 01:37:32
	 *  @param posterUid
	 *  @return
	 */
	public List<Object[]> getCommentByPosterUid(Integer posterUid){
		List<Object[]> list = dao.getCommentByPosterUid(posterUid);
		return list;
	}
	
}
