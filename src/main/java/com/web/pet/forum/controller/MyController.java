package com.web.pet.forum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {

   @GetMapping("/")
   public String index() {
      return "forword:/PetForum/forum.jsp";
   }
}