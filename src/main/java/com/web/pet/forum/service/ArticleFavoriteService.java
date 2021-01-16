package com.web.pet.forum.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;


import com.web.pet.forum.dao.ArticleFavoriteDao;




/**
 *  Class Name: ArticleFavoriteService.java
 *  Description: 
 *  @author ching  DateTime 2021/1/14 下午 01:41:57 
 *  @company 
 *  @email public192021@gmail.com
 *  @version 1.0
 */
@EnableTransactionManagement
@Transactional
@Service
public class ArticleFavoriteService {
	
	@Autowired
	private ArticleFavoriteDao dao;	
	
	
	/**
	 *  Description: 新增一個收藏
	 *  @author ching  DateTime 2021/1/14 下午 01:40:05
	 *  @param posterUid
	 *  @param u_Id
	 *  @return
	 */
	public int saveArticleFavorite(Integer posterUid, Integer u_Id) {
		return dao.saveArticleFavorite(posterUid, u_Id);
	}	
		
	
	/**
	 *  Description: 按u_Id,posterUid找收藏
	 *  @author ching  DateTime 2021/1/14 下午 01:41:33
	 *  @param sessionU_Id
	 *  @param posterUid
	 *  @return
	 */
	public List<Object[]> getArticleFavoriteBy2Uid(Integer sessionU_Id, Integer posterUid){
		List<Object[]> list = dao.getArticleFavoriteBy2Uid(sessionU_Id, posterUid);
		return list;
	}
	
	
	
	/**
	 *  Description: 移除收藏
	 *  @author ching  DateTime 2021/1/14 下午 01:42:09
	 *  @param posterUid
	 *  @param u_Id
	 *  @return
	 */
	public int removeArticleFavorite(Integer posterUid, Integer u_Id) {
		return dao.removeArticleFavorite(posterUid, u_Id);
	}
	
	

	
}
