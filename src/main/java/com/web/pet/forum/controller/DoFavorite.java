package com.web.pet.forum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.forum.service.ArticleFavoriteService;

@RequestMapping("/petforum")
@Controller
public class DoFavorite {
	
	@Autowired
	ArticleFavoriteService service;
	
	
	@RequestMapping("/searchFavoriteRecord")
	public @ResponseBody Boolean searchFavoriteRecord(
			@RequestParam(value="posterUid",required = false) Integer posterUid,			
			HttpServletRequest request) {
		
		
		//需要的是閱讀者的u_Id，非發文者的u_Id		
		Integer u_Id = Integer.valueOf(request.getSession().getAttribute("user").toString());
		
		
			List<Object[]> list = service.getArticleFavoriteBy2Uid(u_Id, posterUid);
			Boolean isFavorite = false;
			
			if(list == null) {//如果favoriteId為空
				service.saveArticleFavorite(posterUid, u_Id);
				isFavorite = true;
				return isFavorite;
			}
			else {//如果favoriteId不為空				
				service.removeArticleFavorite(posterUid, u_Id);
				isFavorite = false;
				return isFavorite;
			}
				
		}		
	}
	
	
	
	
	
	
	

