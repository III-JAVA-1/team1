package com.web.pet.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class OtherFunctionDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Object[]> shoporderDao(String user_id,String queue){//訂單顯示
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="";
		if(queue==null||queue=="") {
			hql = "select [dbo].[order].order_id,[dbo].[order].date,[dbo].[order].cost,[dbo].[order].address,[dbo].[order].remarks,\r\n"
					+ "product.product_name,product.price,[dbo].[order_item].quantity,product.product_id\r\n"
					+ "from [dbo].[order],[dbo].[order_item],product\r\n"
					+ "where [dbo].[order].order_id=[dbo].[order_item].order_id\r\n"
					+ "and [dbo].[order].customer_id like :id\r\n"
					+ "and [dbo].[order_item].product_id=product.product_id";
		}else if(queue.equals("old")) {
			hql="select [dbo].[order].order_id,[dbo].[order].date,[dbo].[order].cost,[dbo].[order].address,[dbo].[order].remarks,\r\n"
					+ "product.product_name,product.price,[dbo].[order_item].quantity,product.product_id\r\n"
					+ "from [dbo].[order],[dbo].[order_item],product\r\n"
					+ "where [dbo].[order].order_id=[dbo].[order_item].order_id\r\n"
					+ "and [dbo].[order].customer_id like :id\r\n"
					+ "and [dbo].[order_item].product_id=product.product_id\r\n"
					+ "order by [dbo].[order].date ";
			
		}else if(queue.equals("new")) {
			hql="select [dbo].[order].order_id,[dbo].[order].date,[dbo].[order].cost,[dbo].[order].address,[dbo].[order].remarks,\r\n"
					+ "product.product_name,product.price,[dbo].[order_item].quantity,product.product_id\r\n"
					+ "from [dbo].[order],[dbo].[order_item],product\r\n"
					+ "where [dbo].[order].order_id=[dbo].[order_item].order_id\r\n"
					+ "and [dbo].[order].customer_id like :id\r\n"
					+ "and [dbo].[order_item].product_id=product.product_id\r\n"
					+ "order by [dbo].[order].date desc";
		}else if(queue.equals("low")) {
			hql="select [dbo].[order].order_id,[dbo].[order].date,[dbo].[order].cost,[dbo].[order].address,[dbo].[order].remarks,\r\n"
					+ "product.product_name,product.price,[dbo].[order_item].quantity,product.product_id\r\n"
					+ "from [dbo].[order],[dbo].[order_item],product\r\n"
					+ "where [dbo].[order].order_id=[dbo].[order_item].order_id\r\n"
					+ "and [dbo].[order].customer_id like :id\r\n"
					+ "and [dbo].[order_item].product_id=product.product_id\r\n"
					+ "order by [dbo].[order].cost";
		}else {
			hql="select [dbo].[order].order_id,[dbo].[order].date,[dbo].[order].cost,[dbo].[order].address,[dbo].[order].remarks,\r\n"
					+ "product.product_name,product.price,[dbo].[order_item].quantity,product.product_id\r\n"
					+ "from [dbo].[order],[dbo].[order_item],product\r\n"
					+ "where [dbo].[order].order_id=[dbo].[order_item].order_id\r\n"
					+ "and [dbo].[order].customer_id like :id\r\n"
					+ "and [dbo].[order_item].product_id=product.product_id\r\n"
					+ "order by [dbo].[order].cost desc";
		}
		
		//System.out.println(user_id);
		Query<Object[]> query= session.createSQLQuery(hql).setParameter("id", user_id);
		System.out.println(hql);
		list=query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}	
	}

}
