package com.web.pet.admin.controller;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.Active.model.ActBean;
import com.web.pet.Active.service.ActService;
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
	@Autowired
	private ActService actservice;
	
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
	
	@RequestMapping("/storetop10")//商品銷售top10
	@ResponseBody
	public List<Object[]> Storetop10(Integer month){
		return adminService.storetop10(month);
	}
	
	@RequestMapping("/allsaless")//當月銷售業績
	@ResponseBody
	public List<Object[]> allsales(Integer month){
		return adminService.allsales(month);
	}
	
	@RequestMapping("/activehottime")//活動顯示時間熱度
	@ResponseBody
	public List<Object[]> activegottimeController(Integer month){
		return adminService.activehottimeService(month);
	}
	
	@RequestMapping("/activejointop3")//活動顯示參加人數top3
	@ResponseBody
	public List<Object[]> activejointop3Controller(Integer month){
		return adminService.activejointop3Service(month);
	}
	
	@RequestMapping("/activetype")//活動顯示參加人數top3
	@ResponseBody
	public List<Object[]> activetypeController(){
		return adminService.activetypeService();
	}
	
	@RequestMapping("/activeall")//活動顯示全部活動
	@ResponseBody
	public List<Object[]> activeallController(){
		return adminService.activeallService();
	}
	
	@RequestMapping(value = "/getactiveimg")//幫活動圖片抓全部東西
	public ResponseEntity<byte[]> getactivePicture(@RequestParam Integer act_no){
		byte[] body= null;
		System.out.println(act_no);
		ResponseEntity<byte[]> re = null;
		ActBean actBean = actservice.AllActService(act_no);
		Blob blob = actBean.getAct_img();
		body = BlobToByteArray.blobToByteArray(blob);
		re = new ResponseEntity<byte[]>(body,HttpStatus.OK);
		return re;

	}
	
	
	@RequestMapping(value="/goadmin")//輸入正確密碼回傳Admin字串，進到Admin頁面
	public String goadmin(){
		return "Admin/Admin";
	}
	
	@RequestMapping(value="/goadminabality")//Admin其他功能的超連結
	public String goadminfunction(@RequestParam String abality) {
		return "Admin/"+abality;
	}
	
}
