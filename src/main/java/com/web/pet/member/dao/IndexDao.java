package com.web.pet.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Object[]> indexshopDao(){//首頁商品
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select product.product_name,product.price,product_image.img,product.product_id\r\n"
				+ "from product,product_image \r\n"
				+ "where product.product_id=product_image.product_id\r\n"
				+ "and product.is_display = 'T'\r\n"
				+ "order by product.create_date desc";
		Query<Object[]> query = session.createSQLQuery(hql);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> indexactiveDao(){//首頁活動
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select top 4 act_name,act_content,act_no\r\n"
				+ "from Active2\r\n"
				+ "where viableNumber=1\r\n"
				+ "ORDER BY NEWID()";
		Query<Object[]> query = session.createSQLQuery(hql);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}

}
