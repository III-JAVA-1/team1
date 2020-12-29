package com.web.pet.member.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.web.pet.member.dao.IndexDao;

@EnableTransactionManagement
@Transactional
@Service
public class IndexService {

	@Autowired
	private IndexDao indexDao;
	
	public List<Object[]> indexshopService(){//首頁商品
	
		return indexDao.indexshopDao();
	}
	
}
