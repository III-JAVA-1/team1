package com.web.pet.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.pet.admin.dao.AdminDao;
import com.web.pet.member.dao.MemberDao;
import com.web.pet.member.model.Member;

@EnableTransactionManagement
@Transactional
@Service
public class AdminService {

	@Autowired
	private AdminDao adaminDao;
	
	public List<Member> membernamesearch(String user_name) {//admin member依名字查詢

		return adaminDao.membernamesearchDao(user_name);
	}

}
