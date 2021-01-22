package com.web.pet.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.pet.member.service.MemberService;
import com.web.pet.member.service.OtherFunctionService;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.PetMomOrder;
import com.web.pet.store.dto.table.OrderDTO;
import com.web.pet.util.BlobToByteArray;
import com.web.pet.util.Compare;
import com.web.pet.util.MailUtils;

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
		mom.setMomId(user_id);
		mom.setMember(memberService.fullmemberService(user_id));
		//out.print(mom.getMom_Id());
		if(picc==null||picc.isEmpty()) {
			mom.setPic(otherFunctionService.getoneMomService(user_id).getPic());
			if(Compare.compareObject(mom, otherFunctionService.getoneMomService(user_id))==false) {
				out.print("<html><body>");
				out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
				out.print("<script>");
				out.print("Swal.fire({\r\n"
	                    + "  icon: 'error',\r\n"
	                    + "  title: '修改失敗，請至少修改一筆資料',\r\n"
	                    + "  showConfirmButton: false,\r\n"
	                    + "  timer: 1500\r\n"
	                    + "}).then((result) => {\r\n"
	                    + "window.location.href='../Member/Editmom.jsp';\r\n"
	                    + "})");
				out.print("</script>");
				out.print("</html></body>");
			}
		}else {
			try {
				byte[] b = picc.getBytes();
				Blob blob = new SerialBlob(b);
				mom.setPic(blob);
				if (otherFunctionService.membereditmomService(mom) > 0) {
					out.print("<html><body>");
					out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
					out.print("<script>");
					out.print("Swal.fire({\r\n"
	                        + "  icon: 'success',\r\n"
	                        + "  title: '修改成功',\r\n"
	                        + "  showConfirmButton: false,\r\n"
	                        + "  timer: 1500\r\n"
	                        + "}).then((result) => {\r\n"
	                        + "window.location.href='../Member/Editmom.jsp';\r\n"
	                        + "})");
					out.print("</script>");
					out.print("</html></body>");
				}

			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		out.close();
	}
	
	@RequestMapping("/mymomorder")
	@ResponseBody
	public List<Object[]> mymomorderController(Integer mid){//會員頁面顯示我的保母訂單
		return otherFunctionService.mymomorderService(mid);
	}
	
	@RequestMapping("/mymomorderpetdetail")
	@ResponseBody
	public List<Object[]> mymomorderpetdetailController(Integer oid){//會員頁面顯示我的保母訂單寵物詳細資料
		return otherFunctionService.mymomorderoetdetailService(oid);
	}
	
	@RequestMapping("/momorderaccept")//會員保母訂單接受寄信並修改訂單狀態
	@ResponseBody
	public Integer orderacceptController(Integer oid) throws IOException, AddressException, MessagingException {
		PetMomOrder petMomOrder = otherFunctionService.momorderacceptService(oid);
		String email = petMomOrder.getMember().getEmail();
		String message = "您預約保母服務: "+petMomOrder.getMom().getTitle()+" 保母已接受此次預約<br>有任何問題歡迎來信告知，謝謝";
		MailUtils.sendMail(email,message);
		return otherFunctionService.momorderaccepteditService(oid);
	}
	
	@RequestMapping("/rejectmomorder")//預約拒絕並修改訂單狀態
	@ResponseBody
	public Integer rejectmomorderController(Integer oid,String message) throws AddressException, MessagingException {
		Integer result =0;
		PetMomOrder petMomOrder = otherFunctionService.momorderacceptService(oid);
		String email = petMomOrder.getMember().getEmail();
		message = "您預約保母服務: "+petMomOrder.getMom().getTitle()+" 保母已拒絕此次預約<br>原因:"+message+"<br>有任何問題歡迎來信告知，謝謝";
		result = otherFunctionService.rejectmomorderService(oid);
		MailUtils.sendMail(email,message);
		return result;
	}
	
	@RequestMapping("/othermomorder")//會員頁面我預約的保母訂單資料
	@ResponseBody
	public List<Object[]> othermomorderController(Integer uid) {
		return otherFunctionService.othermomorderService(uid);
	}
	
	@RequestMapping(value="momorderimg")//保母訂單秀出寵物圖片
	public ResponseEntity<byte[]> getPicture(Integer oid) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		PetMomOrder petMomOrder = otherFunctionService.momorderacceptService(oid);
		Blob blob = petMomOrder.getPicUser();
		body = BlobToByteArray.blobToByteArray(blob);
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		return re;
	}
	
	@RequestMapping("/momorderevaluatee")//會員頁面顯示保母評價
	@ResponseBody
	public List<Object[]> momorderevaluateeController(Integer oid) {
		return otherFunctionService.momorderevaluateeService(oid);
	}
	
	@RequestMapping("/momlove")//會員頁面收藏保母
	@ResponseBody
	public List<Object[]> lovemomController(Integer uid) {
		return otherFunctionService.lovemomService(uid);
	}
	
	@RequestMapping("/delmomlove")//會員頁面收藏保母
	@ResponseBody
	public Integer deletelovemomController(Integer fid) {
		return otherFunctionService.deletelovemomService(fid);
	}
	
	/////////////////////////會員保母功能////////////////////////////////
}
