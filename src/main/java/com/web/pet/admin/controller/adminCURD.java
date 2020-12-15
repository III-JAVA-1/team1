package com.web.pet.admin.controller;

import java.sql.Blob;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.pet.member.model.Member;
import com.web.pet.member.service.MemberService;
import com.web.pet.util.BlobToByteArray;

@RequestMapping(value="/Gusty")
@Controller
public class adminCURD {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/getallimg")//會員頁面秀出圖片
	public ResponseEntity<byte[]> getPicture(@RequestParam Integer id) {
		byte[] body = null;
		//Integer id=Integer.valueOf(request.getSession().getAttribute("user").toString());
		ResponseEntity<byte[]> re = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		Member member = memberService.fullmemberService(id);
		Blob blob = member.getImg();
		body = BlobToByteArray.blobToByteArray(blob);
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		return re;
	}
	
}