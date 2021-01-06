package com.web.pet.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.pet.member.model.Member;
import com.web.pet.member.service.MemberService;
import com.web.pet.member.service.OtherFunctionService;
import com.web.pet.mom.model.Mom;
import com.web.pet.store.dto.table.OrderDTO;

@RequestMapping("/Gusty")
@Controller
public class OtherFunctionCURD {
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	@Autowired
	private OtherFunctionService otherFunctionService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/shoporder")//會員頁面秀出訂單
	@ResponseBody
	public List<OrderDTO> shoporderController(String userid) {
		return otherFunctionService.shoporderService(userid);
	}
	
	@RequestMapping("/shoporderdetail")//會員頁面秀出訂單詳細資料
	@ResponseBody
	public List<Object[]> shoporderdetailController(Integer orderid) {
		return otherFunctionService.shoporderdetailService(orderid);
	}
	
	@RequestMapping("/favoritestore")//會員頁面秀出收藏商品
	@ResponseBody
	public List<Object[]> favoritestoreController(String user_id) {
		return otherFunctionService.favoritestoreService(user_id);
	}
	
	@RequestMapping("/deletlove")//會員頁面取消收藏商品
	@ResponseBody
	public int deleteloveController(String product_id,Integer user_id) {
		return otherFunctionService.deleteloveService(product_id,user_id);
	}
	
	@RequestMapping("/shoprate")//會員頁面秀出商品評價
	@ResponseBody
	public List<Object[]> shoprateController(String user_id) {
		return otherFunctionService.shoprateService(user_id);
	}
	
	/////////////////////////會員商城功能////////////////////////////////
	
	@RequestMapping("/memberarticle")//會員頁面文章記錄
	@ResponseBody
	public List<Object[]> memberarticleController(Integer user_id) {
		return otherFunctionService.memberarticleService(user_id);
	}
	
	@RequestMapping("/membermessage")//會員頁面文章留言
	@ResponseBody
	public List<Object[]> membermessageController(Integer user_id){
		return otherFunctionService.membermessageService(user_id);
	}
	
	@RequestMapping("lovearticle")//會員頁面文章收藏
	@ResponseBody
	public List<Object[]> memberlovearticleController(Integer user_id){
		return otherFunctionService.memberlovearticleService(user_id);
	}
	
	@RequestMapping("deletelovearticle")//會員頁面收藏文章刪除
	@ResponseBody int deletelovearticleController(Integer posteruid,Integer user_id) {
		return otherFunctionService.deletelovearticleService(posteruid, user_id);
	}
	
	/////////////////////////會員論壇功能////////////////////////////////
	
	@RequestMapping("/memberaction")//會員頁面活動紀錄
	@ResponseBody
	public List<Object[]> memberactionController(Integer user_id){
		return otherFunctionService.memberactionService(user_id);
	}
	
	@RequestMapping("/memberjoin")//會員頁面活動參加紀錄
	@ResponseBody
	public List<Object[]> memberjoinController(Integer user_id){
		return otherFunctionService.memberjoinService(user_id);
	}
	
	@RequestMapping("/memberalljoin")//會員頁面活動參加人
	@ResponseBody
	public List<Object[]> memberalljoinController(Integer aid){
		return otherFunctionService.memberalljoinService(aid);
	}
	
	/////////////////////////會員活動功能////////////////////////////////
	
	@RequestMapping("/memberpetshop")//會員頁面店家預約
	@ResponseBody
	public List<Object[]> memberpetshopController(Integer user_id){
		return otherFunctionService.memberpetshopService(user_id);
	}
	
	@RequestMapping("/memberpetshopdelete")//會員頁面店家刪除
	@ResponseBody
	public Integer memberpetshopdeleteController(Integer id){
		return otherFunctionService.memberpetshopdeleteService(id);
	}
	
	/////////////////////////會員店家功能////////////////////////////////
	
	@RequestMapping("/membermom")//會員頁面保母資料修改顯示資料
	@ResponseBody
	public List<Object[]> membermomController(Integer user_id){
		return otherFunctionService.membermomService(user_id);
	}
	
	@RequestMapping("/editmom")//會員保母資料修改
	public void editmomController(Mom mom,MultipartFile picc,HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		Integer user_id=Integer.valueOf(request.getSession().getAttribute("user").toString());
		//out.print(mom.getMom_Id());
		Member member = memberService.fullmemberService(user_id);
		mom.setMember(member);
		if (picc != null && !picc.isEmpty()) {
			try {
				byte[] b = picc.getBytes();
				Blob blob = new SerialBlob(b);
				mom.setPic(blob);
				if(otherFunctionService.membereditmomService(mom)>0) {
					out.print("<html><body>");
	        		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
	        		out.print("<script>");
	        		out.print("Swal.fire({\r\n"
	        				+ "title: '修改成功',\r\n"
	        				+ "icon: 'success',\r\n"
	        				+ "confirmButtonText: '確定'\r\n"
	        				+ "}).then((result) => {\r\n"
	        				+ "if (result.isConfirmed) {\r\n"
	        				+ "window.location.href='../Member/Editmom.jsp';\r\n"
	        				+ "}\r\n"
	        				+ "})");
	        		out.print("</script>");
	        		out.print("</html></body>");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		else {
			out.print("<html><body>");
    		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
    		out.print("<script>");
    		out.print("Swal.fire({\r\n"
    				+ "title: '請選擇圖片',\r\n"
    				+ "icon: 'error',\r\n"
    				+ "confirmButtonText: '確定'\r\n"
    				+ "}).then((result) => {\r\n"
    				+ "if (result.isConfirmed) {\r\n"
    				+ "window.location.href='../Member/Editmom.jsp';\r\n"
    				+ "}\r\n"
    				+ "})");
    		out.print("</script>");
    		out.print("</html></body>");
		}
		out.close();
	}
	
	/////////////////////////會員保母功能////////////////////////////////
}
