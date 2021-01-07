//package com.web.pet.exception;
//
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.servlet.ModelAndView;
//
//@ControllerAdvice
//public class ErrorHandle {
//	
//	@ExceptionHandler
//	public ModelAndView Error(Exception ex) {
//		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("msg","有異常 你就爛啦 哭喔");
//		mv.addObject("exception",ex);
//		mv.setViewName("forward:/ErrorPage.jsp");
//		return mv;
//	}
//}
