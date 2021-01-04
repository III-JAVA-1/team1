package com.web.pet.member.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.pet.Active.model.ActBean;
import com.web.pet.Active.service.ActService;
import com.web.pet.member.service.IndexService;
import com.web.pet.util.BlobToByteArray;

@RequestMapping("/Gusty")
@Controller
public class IndexContrlloer {

	@Autowired
	private IndexService indexService;
	
	@Autowired
	private ActService actservice;
	
	
	@RequestMapping("/indexshop")
	@ResponseBody
	public List<Object[]> indexshopController() {//首頁商品
		return indexService.indexshopService();
	}
	
	@RequestMapping("/indexactive")
	@ResponseBody
	public List<Object[]> indexactiveController() {//首頁活動
		return indexService.indexactiveService();
	}
	
	@RequestMapping(value = "/getactiveimg2")//活動圖片
	public ResponseEntity<byte[]> getPicture(@RequestParam Integer act_no){
		byte[] body= null;
		ResponseEntity<byte[]> re = null;
		ActBean actBean = actservice.AllActService(act_no);
		Blob blob = actBean.getAct_img();
		body = BlobToByteArray.blobToByteArray(blob);
		re = new ResponseEntity<byte[]>(body,HttpStatus.OK);
		return re;
	}
	
}
