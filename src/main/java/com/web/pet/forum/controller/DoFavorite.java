package com.web.pet.forum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.forum.service.ArticleFavoriteService;




/**
 *  Class Name: DoFavorite.java
 *  Description: 
 *  @author ching  DateTime 2021/1/14 下午 01:33:21 
 *  @company 
 *  @email public192021@gmail.com
 *  @version 1.0
 */
@RequestMapping("/petforum")
@Controller
public class DoFavorite {
	
	@Autowired
	private ArticleFavoriteService service;
	
	
	
	/**
	 *  Description:
	 *  @author ching  DateTime 2021/1/14 下午 01:34:01
	 *  @param posterUid
	 *  @param request
	 *  @return
	 */
	@RequestMapping("/searchFavoriteRecord")	
	public @ResponseBody
	Boolean searchFavoriteRecord(
			@RequestParam(value="posterUid",required = false) Integer posterUid,			
			HttpServletRequest request) {
		
		
		//需要的是閱讀者的u_Id，非發文者的u_Id		
		Integer sessionU_Id = Integer.valueOf(request.getSession().getAttribute("user").toString());
		
		
			List<Object[]> list = service.getArticleFavoriteBy2Uid(sessionU_Id, posterUid);
			Boolean isFavorite = false;
			
			if(list == null) {//如果favoriteId為空
				service.saveArticleFavorite(posterUid, sessionU_Id);
				isFavorite = true;
				return isFavorite;
			}
			else {//如果favoriteId不為空				
				service.removeArticleFavorite(posterUid, sessionU_Id);
				isFavorite = false;
				return isFavorite;
			}
				
		}		
	}
	
	
	
	
	
	
	

