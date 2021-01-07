package com.web.pet.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.web.pet.member.model.Member;
import com.web.pet.member.service.MemberService;
import com.web.pet.util.BlobToByteArray;
import com.web.pet.util.MailUtils;
import com.wf.captcha.ChineseGifCaptcha;
import com.wf.captcha.SpecCaptcha;
import com.wf.captcha.utils.CaptchaUtil;


@RequestMapping("/Gusty")
@Controller
public class MemberCURD {

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/captcha")//顯示圖形驗證碼
	public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String s = UUID.randomUUID().toString();
		SpecCaptcha gifCaptcha = new SpecCaptcha(130,48,5);
		gifCaptcha.setFont(ChineseGifCaptcha.FONT_1);
        CaptchaUtil.out(gifCaptcha, request, response);
	}
	
	@RequestMapping("/login")//登入判斷
    public void loginController(String useremail,String password,String 
    		verCode,HttpServletRequest request,
    		HttpServletResponse response) throws IOException, NoSuchAlgorithmException{
        PrintWriter out = response.getWriter();
        List<Member> list = new ArrayList<Member>();
        response.setContentType(CONTENT_TYPE);
        request.setCharacterEncoding(CHARSET_CODE);
		if (!CaptchaUtil.ver(verCode, request)) {
            CaptchaUtil.clear(request);  // 清除session中的验证码
            
            out.print("<html><body>");
    		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
    		out.print("<script>");
    		out.print("Swal.fire({\r\n"
    				+ "title: '驗證碼錯誤，請重新輸入',\r\n"
    				+ "icon: 'error',\r\n"
    				+ "confirmButtonText: '確定'\r\n"
    				+ "}).then((result) => {\r\n"
    				+ "if (result.isConfirmed) {\r\n"
    				+ "window.location.href='../Member/Login.jsp';\r\n"
    				+ "}\r\n"
    				+ "})");
    		out.print("</script>");
    		out.print("</html></body>");
        }
        else {
        	password =  DigestUtils.sha512Hex(password);
        	System.out.println(password);
        	list = memberService.loginService(useremail,password);
        	if(list!=null) {
        		request.getSession().setAttribute("user",list.get(0));
        		Member mebmer = memberService.fullmemberService(Integer.valueOf(request.getSession().getAttribute("user").toString()));
        		if(mebmer.getAuthority()==1) {
        			request.getSession().removeAttribute("user");
        			out.print("<html><body>");
            		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
            		out.print("<script>");
            		out.print("Swal.fire({\r\n"
            				+ "title: '登入失敗，您已被停權',\r\n"
            				+ "icon: 'error',\r\n"
            				+ "confirmButtonText: '確定'\r\n"
            				+ "}).then((result) => {\r\n"
            				+ "if (result.isConfirmed) {\r\n"
            				+ "window.location.href='../Member/Login.jsp';\r\n"
            				+ "}\r\n"
            				+ "})");
            		out.print("</script>");
            		out.print("</html></body>");
            		return;
        		}
        		out.print("<html><body>");
        		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
        		out.print("<script>");
        		out.print("Swal.fire({\r\n"
        				+ "title: '登入成功',\r\n"
        				+ "icon: 'success',\r\n"
        				+ "confirmButtonText: '確定'\r\n"
        				+ "}).then((result) => {\r\n"
        				+ "if (result.isConfirmed) {\r\n"
        				+ "window.location.href='../Member/Member.jsp';\r\n"
        				+ "}\r\n"
        				+ "})");
        		out.print("</script>");
        		out.print("</html></body>");
        	}
        	else {
        		out.print("<html><body>");
        		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
        		out.print("<script>");
        		out.print("Swal.fire({\r\n"
        				+ "title: '登入失敗，請重新登入',\r\n"
        				+ "icon: 'error',\r\n"
        				+ "confirmButtonText: '確定'\r\n"
        				+ "}).then((result) => {\r\n"
        				+ "if (result.isConfirmed) {\r\n"
        				+ "window.location.href='../Member/Login.jsp';\r\n"
        				+ "}\r\n"
        				+ "})");
        		out.print("</script>");
        		out.print("</html></body>");
        	}
        }
		out.close();
    }  
	
	@RequestMapping(value = "/InsertMember",method = RequestMethod.POST)//會員註冊
	public void insertMemberController(Member member,HttpServletResponse response) throws IOException, NoSuchAlgorithmException {
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		member.setPassword(DigestUtils.sha512Hex(member.getPassword()));
		member.setAuthority(0);
		memberService.insertMemberService(member);
		out.print("<html><body>");
		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
		out.print("<script>");
		out.print("Swal.fire({\r\n"
				+ "title: '註冊成功',\r\n"
				+ "icon: 'success',\r\n"
				+ "confirmButtonText: '確定'\r\n"
				+ "}).then((result) => {\r\n"
				+ "if (result.isConfirmed) {\r\n"
				+ "window.location.href='../Member/Login.jsp';\r\n"
				+ "}\r\n"
				+ "})");
		out.print("</script>");
		out.print("</html></body>");
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
	public List<Member> ajaxLoginController(@RequestParam Integer user_id) {//AJAX取得一筆完整會員資料
		System.out.println("user"+user_id);
		List<Member> list = new ArrayList<Member>();
		if(user_id!=null){
			list = memberService.ajaxloginService(user_id);
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
					out.print("<html><body>");
	        		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
	        		out.print("<script>");
	        		out.print("Swal.fire({\r\n"
	        				+ "title: '上傳成功',\r\n"
	        				+ "icon: 'success',\r\n"
	        				+ "confirmButtonText: '確定'\r\n"
	        				+ "}).then((result) => {\r\n"
	        				+ "if (result.isConfirmed) {\r\n"
	        				+ "window.location.href='../Member/Member.jsp';\r\n"
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
    				+ "title: '請選擇照片',\r\n"
    				+ "icon: 'error',\r\n"
    				+ "confirmButtonText: '確定'\r\n"
    				+ "}).then((result) => {\r\n"
    				+ "if (result.isConfirmed) {\r\n"
    				+ "window.location.href='../Member/Member.jsp';\r\n"
    				+ "}\r\n"
    				+ "})");
    		out.print("</script>");
    		out.print("</html></body>");
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
		request.getSession().removeAttribute("sname");
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
		out.print("<script>");
		out.print("Swal.fire({\r\n"
				+ "title: '登出成功',\r\n"
				+ "icon: 'success',\r\n"
				+ "confirmButtonText: '確定'\r\n"
				+ "}).then((result) => {\r\n"
				+ "if (result.isConfirmed) {\r\n"
				+ "window.location.href='../Member/Login.jsp';\r\n"
				+ "}\r\n"
				+ "})");
		out.print("</script>");
		out.print("</html></body>");
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
		member.setImg(originmember.getImg());
		member.setAuthority(originmember.getAuthority());
		if(memberService.updatememberService(member)>0) {
			out.print("<html><body>");
    		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
    		out.print("<script>");
    		out.print("Swal.fire({\r\n"
    				+ "title: '個人資料更新成功',\r\n"
    				+ "icon: 'success',\r\n"
    				+ "confirmButtonText: '確定'\r\n"
    				+ "}).then((result) => {\r\n"
    				+ "if (result.isConfirmed) {\r\n"
    				+ "window.location.href='../Member/Member.jsp';\r\n"
    				+ "}\r\n"
    				+ "})");
    		out.print("</script>");
    		out.print("</html></body>");
		}
		else {
			out.print("<html><body>");
    		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
    		out.print("<script>");
    		out.print("Swal.fire({\r\n"
    				+ "title: '個人資料更新成功',\r\n"
    				+ "icon: 'error',\r\n"
    				+ "confirmButtonText: '確定'\r\n"
    				+ "}).then((result) => {\r\n"
    				+ "if (result.isConfirmed) {\r\n"
    				+ "window.location.href='../Member/Member.jsp';\r\n"
    				+ "}\r\n"
    				+ "})");
    		out.print("</script>");
    		out.print("</html></body>");
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
		member.setPassword(DigestUtils.sha512Hex(password));
		if(memberService.uploadimgService(member)>0) {
			request.getSession().removeAttribute("user");
			out.print("<html><body>");
    		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
    		out.print("<script>");
    		out.print("Swal.fire({\r\n"
    				+ "title: '密碼更新成功，請重新登入',\r\n"
    				+ "icon: 'success',\r\n"
    				+ "confirmButtonText: '確定'\r\n"
    				+ "}).then((result) => {\r\n"
    				+ "if (result.isConfirmed) {\r\n"
    				+ "window.location.href='../Member/Login.jsp';\r\n"
    				+ "}\r\n"
    				+ "})");
    		out.print("</script>");
    		out.print("</html></body>");
		}
		else {
			out.print("<html><body>");
    		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
    		out.print("<script>");
    		out.print("Swal.fire({\r\n"
    				+ "title: '密碼更新失敗',\r\n"
    				+ "icon: 'error',\r\n"
    				+ "confirmButtonText: '確定'\r\n"
    				+ "}).then((result) => {\r\n"
    				+ "if (result.isConfirmed) {\r\n"
    				+ "window.location.href='../Member/Member.jsp';\r\n"
    				+ "}\r\n"
    				+ "})");
    		out.print("</script>");
    		out.print("</html></body>");
		}
	}
	
	@RequestMapping(value = "/googleVerify", method = RequestMethod.POST)//GOOGLE第三方登入
	public void verifyToken(String idtokenstr,HttpServletResponse response,HttpServletRequest request) throws IOException {
		//System.out.println(idtokenstr);
		response.setContentType(CONTENT_TYPE);
		PrintWriter out = response.getWriter();
		int dupilate=0;
		Member member = new Member();
		List<Member> list = new ArrayList<Member>();
		list = memberService.ajaxloginService();
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
				new NetHttpTransport(), JacksonFactory.getDefaultInstance())
				.setAudience(Collections.singletonList("343913388884-d9vp78dklqeej4slebrsgqhbk7jq0bbg.apps.googleusercontent.com")).build();
		GoogleIdToken idToken = null;
		try {
			idToken = verifier.verify(idtokenstr);
		} catch (GeneralSecurityException e) {
			System.out.println("驗證時出現GeneralSecurityException異常");
		} catch (IOException e) {
			System.out.println("驗證時出現IOException異常");
		}
		if (idToken != null) {
			//System.out.println("驗證成功.");
			Payload payload = idToken.getPayload();
			//System.out.println("User ID: " + userId);
			String email = payload.getEmail();
			//boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			String name = (String) payload.get("name");
			String pictureUrl = (String) payload.get("picture");
			System.out.println(email);
			System.out.println(name);
			System.out.println(pictureUrl);
			for(int i=0;i<list.size();i=i+1) {
				if(email.equalsIgnoreCase(list.get(i).getEmail().trim())) {
					if(list.get(i).getPassword().contains("http")) {
						request.getSession().setAttribute("user",list.get(i).getU_Id());
						out.print("成功");
						dupilate=2;
						break;
					}else {
						dupilate=1;
						break;
					}
				}
			}
			if(dupilate==1) {
				out.print("重複");
			}else if(dupilate==0){
				//java.util.Date today = Date
				member.setName(name);
				member.setEmail(email);
				member.setPassword(pictureUrl);
				member.setSname("Google登入者");
				member.setBirth(new java.sql.Date(new java.util.Date().getTime()));
				memberService.insertMemberService(member);
				list = memberService.ajaxloginService();
				for(int i=0;i<list.size();i=i+1) {
					if(list.get(i).getEmail().equals(email)) {
						request.getSession().setAttribute("user",list.get(i).getU_Id());
					}
				}
				out.print("成功");
			}
			
		} else {
			System.out.println("Invalid ID token.");
		}
		out.close();
	}
	
	@RequestMapping("/forget")//忘記密碼
	public void forgetpassword(@RequestParam String forgetemail,HttpServletResponse response) throws IOException {
		int faker=0;
		response.setContentType(CONTENT_TYPE);
		Member member = new Member();
		PrintWriter out = response.getWriter();
		String s = UUID.randomUUID().toString();
		//System.out.println(s.substring(0,s.indexOf("-")));
		List<Member> list = new ArrayList<Member>();
		list = memberService.ajaxloginService();
		for(int i=0;i<list.size();i=i+1) {
			if(list.get(i).getEmail().equals(forgetemail)) {
				faker=list.get(i).getU_Id();
				break;
			}
		}
		if(faker==0) {
			out.print("<html><body>");
    		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
    		out.print("<script>");
    		out.print("Swal.fire({\r\n"
    				+ "title: '錯誤電子郵件',\r\n"
    				+ "icon: 'error',\r\n"
    				+ "confirmButtonText: '確定'\r\n"
    				+ "}).then((result) => {\r\n"
    				+ "if (result.isConfirmed) {\r\n"
    				+ "window.location.href='../Member/Login.jsp';\r\n"
    				+ "}\r\n"
    				+ "})");
    		out.print("</script>");
    		out.print("</html></body>");
		}else {
			member=memberService.fullmemberService(faker);
			member.setPassword(DigestUtils.sha512Hex(s.substring(0,s.indexOf("-"))));
			memberService.uploadimgService(member);
			try {
				MailUtils.sendMail(forgetemail, "你的新密碼:"+s.substring(0,s.indexOf("-")));
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			out.print("<html><body>");
    		out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
    		out.print("<script>");
    		out.print("Swal.fire({\r\n"
    				+ "title: '新密碼已送出到信箱，請使用新密碼登入',\r\n"
    				+ "icon: 'success',\r\n"
    				+ "confirmButtonText: '確定'\r\n"
    				+ "}).then((result) => {\r\n"
    				+ "if (result.isConfirmed) {\r\n"
    				+ "window.location.href='../Member/Login.jsp';\r\n"
    				+ "}\r\n"
    				+ "})");
    		out.print("</script>");
    		out.print("</html></body>");
		}
		out.close();
	}
	
}
