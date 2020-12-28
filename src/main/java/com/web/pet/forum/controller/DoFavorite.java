package com.web.pet.forum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.pet.forum.service.ArticleLikeService;

@RequestMapping("/petforum")
@Controller
public class DoFavorite {
	
	@Autowired
	ArticleLikeService service;
	
	
	
	
}
