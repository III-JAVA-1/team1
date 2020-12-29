package com.web.pet.petshop.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.pet.petshop.Dao.PetshopDao;
import com.web.pet.petshop.model.PetshopBean;

@EnableTransactionManagement
@Transactional
@Service
public class PetshopService {
	
	@Autowired
	private PetshopDao petshopDao;
	
	public List<PetshopBean> allpetshopService(String storename,String pettype,String shoptype) {//admin member依名字查詢

		return petshopDao.allpetshop(storename,pettype,shoptype);
	}

}
