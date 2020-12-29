package com.web.pet.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.member.model.Member;

@Repository
public class AdminDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Member> membernamesearchDao(String user_name){//admin member依名字查詢
		List<Member> list = new ArrayList<Member>();
		Session session = sessionFactory.getCurrentSession();
		Query<Member> query=null;
		String hql = "select u_id,name,phone,email,sname,zip,country,district,address,momId,gender,birth FROM Member where name like '%"+user_name+"%'";
		query= session.createNativeQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	
	@SuppressWarnings("unchecked")//商品銷售Top10
	public List<Object[]> storetop10(Integer month){
		List<Object[]> list = new ArrayList<Object[]>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select product.product_name,count(order_item.product_id)\n"
				+ "from order_item,product,[dbo].[order]\n"
				+ "where month([dbo].[order].date)=:month\n"
				+ "and order_item.product_id = product.product_id\n"
				+ "and order_item.order_id=[dbo].[order].order_id\n"
				+ "group by product.product_name \n"
				+ "order by count(order_item.product_id) desc";
		Query<Object[]> query=null;
		query = session.createNativeQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//銷售總金額
	public List<Object[]> allsales (Integer month){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select day([dbo].[order].date) as '日期',sum([dbo].[order].cost) as '總金額'\n"
				+ "from [dbo].[order]\n"
				+ "where Month([dbo].[order].date)=:month\n"
				+ "group by day([dbo].[order].date)\n"
				+ "order by day([dbo].[order].date)";
		Query<Object[]> query=null;
		query = session.createNativeQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}

}
