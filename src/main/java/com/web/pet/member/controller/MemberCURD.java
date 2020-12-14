package com.web.pet.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.pet.member.model.Member;
import com.web.pet.member.service.MemberService;
import com.web.pet.util.BlobToByteArray;
import com.wf.captcha.GifCaptcha;
import com.wf.captcha.utils.CaptchaUtil;


/**
 * 
 * @author Gusty
 * 所有一切有關登入登出和Header顯示都放在這邊
 * 我覺得冗碼過多
 */

@RequestMapping("/Gusty")
@Controller
public class MemberCURD {

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/captcha")//顯示圖形驗證碼
	public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
		GifCaptcha gifCaptcha = new GifCaptcha(130,48,5);
        CaptchaUtil.out(gifCaptcha, request, response);
	}
	
	@RequestMapping("/login")//登入判斷
    public void loginController(String useremail,String password,String verCode,HttpServletRequest request,HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();
        List<Member> list = new ArrayList<Member>();
        response.setContentType(CONTENT_TYPE);
        request.setCharacterEncoding(CHARSET_CODE);
		if (!CaptchaUtil.ver(verCode, request)) {
            CaptchaUtil.clear(request);  // 清除session中的验证码
            out.print("<script>");
    		out.print("window.alert('驗證碼錯誤'); window.location.href='../Member/Login.jsp';");
    		out.print("</script>");
        }
        else {
        	list = memberService.loginService(useremail,password);
        	if(list!=null) {
        		request.getSession().setAttribute("user",list.get(0));
        		out.print("<script>");
        		out.print("window.alert('登入成功，轉到會員畫面'); window.location.href='../Member/Member.jsp';");
        		out.print("</script>");
        	}
        	else {
        		out.print("<script>");
        		out.print("window.alert('登入失敗，請重新登入'); window.location.href='../Member/Login.jsp';");
        		out.print("</script>");
        	}
        }
		out.close();
    }  
	
	@RequestMapping(value = "/InsertMember",method = RequestMethod.POST)//會員註冊
	public void insertMemberController(Member member,HttpServletResponse response) throws IOException {
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		memberService.insertMemberService(member);
		out.print("<script>");
		out.print("window.alert('註冊成功，轉回登入畫面'); window.location.href='../Member/Login.jsp';");
		out.print("</script>");
		out.close();
	}
	
	@RequestMapping(value = "/logincheck")
	@ResponseBody
	public List<Member> ajaxLoginController() {//取得全部會員資料做註冊AJAX判斷
		List<Member> list = new ArrayList<Member>();
		list = memberService.ajaxloginService();
		return list;		
	}
	
	@RequestMapping(value = "/headercheck")
	@ResponseBody
	public List<Member> ajaxLoginController(HttpServletRequest request) {//AJAX取得一筆完整會員資料
		List<Member> list = new ArrayList<Member>();
		if(!request.getParameter("user_id").isEmpty()){
			list = memberService.ajaxloginService(Integer.valueOf(request.getParameter("user_id").toString()));
			return list;		
		}
		else {
			return null;
		}
	}
	
	@RequestMapping(value = "upload")//圖片上傳寫入
	public void imguploadController(MultipartFile image,HttpServletRequest request,HttpServletResponse response) throws IOException {
		Integer id=Integer.valueOf(request.getSession().getAttribute("user").toString());
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		Member member = memberService.fullmemberService(id);
		System.out.println(image);
		if (image != null && !image.isEmpty()) {
			try {
				byte[] b = image.getBytes();
				Blob blob = new SerialBlob(b);
				member.setImg(blob);
				if(memberService.uploadimgService(member)>0) {
					out.print("<script>");
					out.print("window.alert('上傳成功'); window.location.href='../Member/Member.jsp';");
					out.print("</script>");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		else {
			out.print("<script>");
			out.print("window.alert('請選擇照片'); window.location.href='../Member/Member.jsp';");
			out.print("</script>");
		}
		out.close();
	}
	
	@RequestMapping(value="getimg")//會員頁面秀出圖片
	public ResponseEntity<byte[]> getPicture(HttpServletRequest request) {
		byte[] body = null;
		Integer id=Integer.valueOf(request.getSession().getAttribute("user").toString());
		ResponseEntity<byte[]> re = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		Member member = memberService.fullmemberService(id);
		Blob blob = member.getImg();
		body = BlobToByteArray.blobToByteArray(blob);
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		return re;
	}
	
	@RequestMapping(value="logout")//處理登出
	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		request.getSession().removeAttribute("user");
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("window.alert('登出成功，回到登入畫面'); window.location.href='../Member/Login.jsp';");
		out.print("</script>");
		out.close();
	}
	
	@RequestMapping(value = "UpdateMember")//更新會員基本資料
	public void updateMemberController(Member member,HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		member.setU_Id(Integer.valueOf(request.getSession().getAttribute("user").toString()));
		Integer id = Integer.valueOf(request.getSession().getAttribute("user").toString());
		Member originmember = memberService.fullmemberService(id);
		member.setPassword(originmember.getPassword());
		member.setBirth(originmember.getBirth());
		member.setId(originmember.getId());
		member.setImg(originmember.getImg());
		if(memberService.updatememberService(member)>0) {
			out.print("<script>");
			out.print("window.alert('個人資料更新成功'); window.location.href='../Member/Member.jsp';");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("window.alert('個人資料更新失敗'); window.location.href='../Member/Member.jsp';");
			out.print("</script>");
		}
		out.close();
	}
	
	@RequestMapping(value = "updatepassword")//更新密碼
	public void updatePasswordController(String password, HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		Integer id = Integer.valueOf(request.getSession().getAttribute("user").toString());
		Member member = memberService.fullmemberService(id);
		member.setPassword(password);
		if(memberService.uploadimgService(member)>0) {
			request.getSession().removeAttribute("user");
			out.print("<script>");
			out.print("window.alert('密碼更新成功，請重新登入'); window.location.href='../Member/Login.jsp';");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("window.alert('密碼更新失敗'); window.location.href='../Member/Member.jsp';");
			out.print("</script>");
		}
	}
	
	
}
