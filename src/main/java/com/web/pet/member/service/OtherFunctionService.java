package com.web.pet.member.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.web.pet.member.dao.OtherFunctionDao;

@EnableTransactionManagement
@Transactional
@Service
public class OtherFunctionService {
	
	@Autowired
	private OtherFunctionDao otherFunctionDao;
	
	public List<Object[]> shoporderService(String user_id,String queue){
		
		return otherFunctionDao.shoporderDao(user_id,queue);
	}

}
