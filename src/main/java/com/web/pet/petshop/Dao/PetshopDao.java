package com.web.pet.petshop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.petshop.model.PetshopBean;

@Repository
public class PetshopDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<PetshopBean> allpetshop(String storename,String pettype,String shoptype){//
		if(storename==null) {storename="";}
		if(pettype==null||pettype=="") {pettype="%%";}
		if(shoptype==null||shoptype=="") {shoptype="%%";}
		List<PetshopBean> list = new ArrayList<PetshopBean>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM PetshopBean where name like '%"+storename+"%' and pet like '"+pettype+"' and type like '"+shoptype+"'";
		Query<PetshopBean> query=null;
		query= session.createQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}

}
