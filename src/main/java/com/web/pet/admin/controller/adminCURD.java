package com.web.pet.admin.controller;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.admin.service.AdminService;
import com.web.pet.member.model.Member;
import com.web.pet.member.service.MemberService;
import com.web.pet.util.BlobToByteArray;

@RequestMapping(value="/Gusty")
@Controller
public class adminCURD {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/adminmembernamesearch")
	@ResponseBody
	public List<Member> ajaxLoginController(@RequestParam String user_name) {//admin member依名字查詢
		List<Member> list = new ArrayList<Member>();
		list = adminService.membernamesearch(user_name);
		if(list==null||list.isEmpty()) {
			return null;
		}else {
			return list;
		}		
	}

	@RequestMapping(value="/getallimg")//管理者會員頁面秀出全部會員圖片
	public ResponseEntity<byte[]> getPicture(@RequestParam Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		Member member = memberService.fullmemberService(id);
		Blob blob = member.getImg();
		if(blob==null) {
			return null;
		}else {
			body = BlobToByteArray.blobToByteArray(blob);
			re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
			return re;
		}	
	}
	
	@RequestMapping(value="/goadmin")//輸入正確密碼回傳Admin字串，進到Admin頁面
	public String goadmin(){
		
		return "Admin/Admin";
	}
	
	
	@RequestMapping(value="/goadminabality")//Admin其他功能的超連結
	public String goadminfunction(@RequestParam String abality,@RequestParam String admin) {
		
		return "Admin/"+abality;
	}
	
}
