package com.web.pet.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.pet.member.dao.MemberDao;
import com.web.pet.member.model.Member;

@EnableTransactionManagement
@Transactional
@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	public void insertMemberService(Member member) {//會員註冊
		memberDao.insertMemberDao(member);
	}
	
	public List<Member> ajaxloginService() {//取得全部會員資料做註冊AJAX判斷
		return memberDao.ajaxloginDao();
	}
	
	public List<Member> ajaxloginService(int user_id) {//取得一筆會員完整資料做Header AJAX
		return memberDao.ajaxloginDao(user_id);
	}
	
	public List<Member> loginService(String useremail, String password) {//驗證登入是否成功
		return memberDao.loginDao(useremail, password);
	}
	
	public Member fullmemberService(Integer id) {//取得登入的member物件
		return memberDao.fullmemberDao(id);
	}
	
	public int uploadimgService(Member member) {//上傳圖片
		return memberDao.uploadimgDao(member);
	}
	
	public int updatememberService(Member member) {//更新會員基本資料
		return memberDao.updatememberDao(member);
	}

}
