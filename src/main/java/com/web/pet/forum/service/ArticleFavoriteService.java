package com.web.pet.forum.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;


import com.web.pet.forum.dao.ArticleFavoriteDao;
import com.web.pet.forum.model.ArticleFavorite;

@EnableTransactionManagement
@Transactional
@Service
public class ArticleFavoriteService {
	
	@Autowired
	ArticleFavoriteDao dao;	
	
	public int saveArticleFavorite(Integer posterUid, Integer u_Id) {//新增一個收藏
		return dao.saveArticleFavorite(posterUid, u_Id);
	}	
	
	public List<ArticleFavorite> getAllArticleFavorites(String hql) {//依hql條件取得所有收藏			
		 List<ArticleFavorite> list = dao.getAllArticleFavorites(hql);		
		return list;
	}	

	public ArticleFavorite getArticleFavorite(Integer articleFavoriteId) {//取得一個收藏		
		 ArticleFavorite articleFavorite = dao.getArticleFavorite(articleFavoriteId);
		return articleFavorite;		
	}
	
	public List<Object[]> getArticleFavoriteBy2Uid(Integer u_Id, Integer posterUid){//按u_Id,posterUid找收藏
		List<Object[]> list = dao.getArticleFavoriteBy2Uid(u_Id, posterUid);
		return list;
	}
	
	public int removeArticleFavorite(Integer posterUid, Integer u_Id) {//移除收藏
		return dao.removeArticleFavorite(posterUid, u_Id);
	}
	
	

	
}
