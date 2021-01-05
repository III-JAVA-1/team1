package com.web.pet.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletResponse;

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
import com.web.pet.forum.model.Article;
import com.web.pet.forum.model.Comment;
import com.web.pet.forum.service.ArticleService;
import com.web.pet.forum.service.CommentService;
import com.web.pet.member.model.Member;
import com.web.pet.member.service.MemberService;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.service.MomService;
import com.web.pet.petshop.model.PetshopBean;
import com.web.pet.util.BlobToByteArray;
import com.web.pet.util.MailUtils;

@RequestMapping(value="/Gusty")
@Controller
public class adminCURD {
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ActService actservice;
	@Autowired
	private CommentService commentservice;	
	@Autowired
	private ArticleService articleservice;
	
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
	
	//////////////////////////////會員管理////////////////////////////////////
	
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
	
	//////////////////////////////商城管理////////////////////////////////////
	
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
	
	@RequestMapping("/activejoinall")//活動顯示全部活動的參加人數
	@ResponseBody
	public List<Object[]> activeloinallController(Integer aid){
		return adminService.activejoinallService(aid);
	}
	
	@RequestMapping("/activecheck")//活動顯示要審核的活動
	@ResponseBody
	public List<Object[]> activecheckController(){
		return adminService.activecheckService();
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
	
	@RequestMapping("/activeok")//活動審核通過
	@ResponseBody
	public Integer activeokController(Integer aid) throws AddressException, MessagingException {	
		String message="";
		ActBean actBean = actservice.AllActService(aid);
		message = "您發起的活動『"+actBean.getAct_name()+"』成功通過審核<br>可至會員專區查看報名的詳細資料<br>有任何問題歡迎來信告知，謝謝";
		Member member = memberService.fullmemberService(actBean.getMember().getU_Id());
		MailUtils.sendMail(member.getEmail(),message);
		return adminService.activeokService(aid);
	}
	
	@RequestMapping("/activedelete")//不予許活動通過
	@ResponseBody
	public Integer activedeleteController(Integer aid,String message) throws AddressException, MessagingException {
		ActBean actBean = actservice.AllActService(aid);
		//actBean.getMember().getU_Id();
		message = "您的活動『"+actBean.getAct_name()+"』審核不通過<br>原因:"+message+"<br>有任何問題歡迎來信告知，謝謝";
		Member member = memberService.fullmemberService(actBean.getMember().getU_Id());
		MailUtils.sendMail(member.getEmail(),message);
		return adminService.activedeleteService(aid);
	}
	
	//////////////////////////////活動管理////////////////////////////////////
	
	
	@RequestMapping("/articlehot")//文章顯示發文熱度
	@ResponseBody
	public List<Object[]> articlehotController(Integer month){
		return adminService.articlehotService(month);
	}
	
	@RequestMapping("/articletop3")//文章顯示本月文章點閱率top3
	@ResponseBody
	public List<Object[]> articletop3Controller(Integer month){
		return adminService.articletop3Service(month);
	}
	
	@RequestMapping("/articletype")//文章顯示子版比例
	@ResponseBody
	public List<Object[]> articletypeController(){
		return adminService.articletypeService();
	}
	
	@RequestMapping("/articlefull")//文章總覽分頁和搜尋
	@ResponseBody
	public List<Object[]> articlefullController(){
		return adminService.articlefullService();
	}
	
	@RequestMapping("/articledetail")//文章詳細內容
	@ResponseBody
	public List<Object[]> articledetailController(Integer aid){
		return adminService.articledetailService(aid);
	}
	
	@RequestMapping("/articlecomment")//文章留言內容
	@ResponseBody
	public List<Object[]> articlecommentController(Integer aid){
		return adminService.articlecommentService(aid);
	}
	
	@RequestMapping("/articlecommentdelete")//文章留言內容刪除
	@ResponseBody
	public Integer articlecommentdeleteController(Integer cid,String message) throws AddressException, MessagingException{
		Comment comment = commentservice.getComment(cid);
		message = "您的留言『"+comment.getCommentContent()+"』已被刪除<br>原因:"+message+"<br>有任何問題歡迎來信告知，謝謝";
		Member member = memberService.fullmemberService(comment.getMember().getU_Id());
		MailUtils.sendMail(member.getEmail(),message);
		return adminService.articlecommentdeleteService(cid);
	}
	
	@RequestMapping("/articledelete")//文章內容+留言+喜愛刪除
	@ResponseBody
	public Integer articledeleteController(Integer aid,String message) throws AddressException, MessagingException{
		Article article = articleservice.getArticle(aid);
		message = "您的文章『"+article.getHeader()+"』已被刪除<br>原因:"+message+"<br>有任何問題歡迎來信告知，謝謝";
		Member member = memberService.fullmemberService(article.getMember().getU_Id());
		MailUtils.sendMail(member.getEmail(),message);
		return adminService.articledeleteService(aid);
	}
	
	//////////////////////////////文章管理////////////////////////////////////
	
	@RequestMapping("/petshophot")//店家預約熱度
	@ResponseBody
	public List<Object[]> petshophotController(Integer month){
		return adminService.petshophotService(month);
	}
	
	@RequestMapping("/petshoptop3")//店家預約top3
	@ResponseBody
	public List<Object[]> petshoptop3Controller(){
		return adminService.petshoptop3Service();
	}
	
	@RequestMapping(value="/petshopadd")//新增店家
	public void addnewstore(PetshopBean petshopBean,HttpServletResponse response) throws IOException {
		adminService.addnewstoreService(petshopBean);
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
		out.print("<script>");
		out.print("Swal.fire({\r\n"
				+ "title: '新增成功',\r\n"
				+ "icon: 'success',\r\n"
				+ "confirmButtonText: '確定'\r\n"
				+ "}).then((result) => {\r\n"
				+ "if (result.isConfirmed) {\r\n"
				+ "window.location.href='http://localhost:8087/PetProject_Final/Gusty/goadminabality?abality=Petshop';\r\n"
				+ "}\r\n"
				+ "})");
		out.print("</script>");
		out.print("</html></body>");
		out.close();
	}
	
	@RequestMapping("/petshopall")//顯示全部店家
	@ResponseBody
	public List<Object[]> petshopallController(String search,Integer page){
		return adminService.petshopallService(search,page);
	}
	
	@RequestMapping("/petshopdelete")//刪除店家
	@ResponseBody
	public Integer petshopdeleteController(Integer sid){
		return adminService.petshopdeleteService(sid);
	}
	
	//////////////////////////////店家管理////////////////////////////////////
	
	@RequestMapping("/allmom")//顯示全部保母
	@ResponseBody
	public List<Object[]> allmomController(){
		return adminService.allmomService();
	}
	
	@RequestMapping("/deletemom")//刪除保母
	@ResponseBody
	public Integer deletemomController(Integer mid,String message) throws AddressException, MessagingException{
		Mom mom = adminService.getfullmomService(mid);
		message = "您的保母『"+mom.getTitle()+"』已被刪除<br>原因:"+message+"<br>有任何問題歡迎來信告知，謝謝";
		Member member = memberService.fullmemberService(mom.getMember().getU_Id());
		MailUtils.sendMail(member.getEmail(),message);
		return adminService.deletemomService(mid);
	}
	
	//////////////////////////////保母管理////////////////////////////////////
	
	@RequestMapping(value="/goadmin")//輸入正確密碼回傳Admin字串，進到Admin頁面
	public String goadmin(){
		return "Admin/Admin";
	}
	
	@RequestMapping(value="/goadminabality")//Admin其他功能的超連結
	public String goadminfunction(@RequestParam String abality) {
		return "Admin/"+abality;
	}
	
	/////////////////////////////其他功能管理////////////////////////////////////
	
}
