package com.web.pet.forum.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;


import com.web.pet.forum.dao.ArticleLikeDao;
import com.web.pet.forum.model.ArticleLike;

@EnableTransactionManagement
@Transactional
@Service
public class ArticleLikeService {
	
	@Autowired
	ArticleLikeDao dao;	
	
	public int saveArticleLike(ArticleLike articleLike) {//新增一個收藏
		return dao.saveArticleLike(articleLike);
	}	
	
	public List<ArticleLike> getAllArticleLikes(String hql) {//依hql條件取得所有收藏			
		 List<ArticleLike> list = dao.getAllArticleLikes(hql);		
		return list;
	}	

	public ArticleLike getArticleLike(Integer articleLikeId) {//取得一個收藏		
		 ArticleLike articleLike = dao.getArticleLike(articleLikeId);
		return articleLike;		
	}
	
	public List<ArticleLike> getArticleLikeBy2Uid(Integer u_Id, Integer posterUid){//按u_Id,posterUid找收藏
		List<ArticleLike> list = dao.getArticleLikeBy2Uid(u_Id, posterUid);
		return list;
	}
	
	public int removeArticleLike(ArticleLike articleLike) {//移除收藏
		return dao.removeArticleLike(articleLike);
	}
	
	

	
}
