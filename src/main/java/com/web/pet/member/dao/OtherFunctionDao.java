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
	public List<Object[]> shoporderDao(String user_id,String queue,Integer page){//會員頁面秀出訂單
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="";
		if(queue==null||queue=="") {
			hql = "select [dbo].[order].order_id,[dbo].[order].date,[dbo].[order].cost,[dbo].[order].address,[dbo].[order].remarks,\r\n"
					+ "product.product_name,product.price,[dbo].[order_item].quantity,product.product_id,[dbo].[order].customer_id\r\n"
					+ "from [dbo].[order],[dbo].[order_item],product\r\n"
					+ "where [dbo].[order].order_id=[dbo].[order_item].order_id\r\n"
					+ "and [dbo].[order].customer_id like :id\r\n"
					+ "and [dbo].[order_item].product_id=product.product_id";
		}else if(queue.equals("old")) {
			hql="select [dbo].[order].order_id,[dbo].[order].date,[dbo].[order].cost,[dbo].[order].address,[dbo].[order].remarks,\r\n"
					+ "product.product_name,product.price,[dbo].[order_item].quantity,product.product_id,[dbo].[order].customer_id\r\n"
					+ "from [dbo].[order],[dbo].[order_item],product\r\n"
					+ "where [dbo].[order].order_id=[dbo].[order_item].order_id\r\n"
					+ "and [dbo].[order].customer_id like :id\r\n"
					+ "and [dbo].[order_item].product_id=product.product_id\r\n"
					+ "order by [dbo].[order].date ";
			
		}else if(queue.equals("new")) {
			hql="select [dbo].[order].order_id,[dbo].[order].date,[dbo].[order].cost,[dbo].[order].address,[dbo].[order].remarks,\r\n"
					+ "product.product_name,product.price,[dbo].[order_item].quantity,product.product_id,[dbo].[order].customer_id\r\n"
					+ "from [dbo].[order],[dbo].[order_item],product\r\n"
					+ "where [dbo].[order].order_id=[dbo].[order_item].order_id\r\n"
					+ "and [dbo].[order].customer_id like :id\r\n"
					+ "and [dbo].[order_item].product_id=product.product_id\r\n"
					+ "order by [dbo].[order].date desc";
		}else if(queue.equals("low")) {
			hql="select [dbo].[order].order_id,[dbo].[order].date,[dbo].[order].cost,[dbo].[order].address,[dbo].[order].remarks,\r\n"
					+ "product.product_name,product.price,[dbo].[order_item].quantity,product.product_id,[dbo].[order].customer_id\r\n"
					+ "from [dbo].[order],[dbo].[order_item],product\r\n"
					+ "where [dbo].[order].order_id=[dbo].[order_item].order_id\r\n"
					+ "and [dbo].[order].customer_id like :id\r\n"
					+ "and [dbo].[order_item].product_id=product.product_id\r\n"
					+ "order by [dbo].[order].cost";
		}else {
			hql="select [dbo].[order].order_id,[dbo].[order].date,[dbo].[order].cost,[dbo].[order].address,[dbo].[order].remarks,\r\n"
					+ "product.product_name,product.price,[dbo].[order_item].quantity,product.product_id,[dbo].[order].customer_id\r\n"
					+ "from [dbo].[order],[dbo].[order_item],product\r\n"
					+ "where [dbo].[order].order_id=[dbo].[order_item].order_id\r\n"
					+ "and [dbo].[order].customer_id like :id\r\n"
					+ "and [dbo].[order_item].product_id=product.product_id\r\n"
					+ "order by [dbo].[order].cost desc";
		}
		Query<Object[]> query = null;
		if(page!=null) {
			if(page==1) {query= session.createSQLQuery(hql).setParameter("id", user_id).setFirstResult(0).setMaxResults(10);}
			if(page==2) {query= session.createSQLQuery(hql).setParameter("id", user_id).setFirstResult(10).setMaxResults(20);}
			if(page==3) {query= session.createSQLQuery(hql).setParameter("id", user_id).setFirstResult(20).setMaxResults(30);}
			if(page==4) {query= session.createSQLQuery(hql).setParameter("id", user_id).setFirstResult(30).setMaxResults(40);}
		}else {
			query= session.createSQLQuery(hql).setParameter("id", user_id).setFirstResult(0).setMaxResults(10);
		}
		
		list=query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}	
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> shopfavorite(String user_id){//會員頁面秀出收藏商品
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select product.product_name,product_image.img,product.product_id,favorite.customer_id\r\n"
				+ "from favorite,product,product_image\r\n"
				+ "where favorite.customer_id = :id\r\n"
				+ "and product.product_id=favorite.product_id\r\n"
				+ "and favorite.product_id=product_image.product_id";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> shoprateDao(String user_id){//會員頁面秀出商品評價
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select product.product_name,rate.rate,rate.message,rate.date,rate.customer_id,rate.product_id\r\n"
				+ "from rate,product\r\n"
				+ "where rate.product_id=product.product_id\r\n"
				+ "and rate.customer_id=:id";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> articlememberDao(Integer user_id){//會員頁面文章記錄
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select Article.header,Article.forumId,Article.updatedTime,Article.viewing,count(Comment.posterUid) as'留言數'\r\n"
				+ "from Article left join Comment\r\n"
				+ "on Article.isHide=0\r\n"
				+ "and Article.u_Id=:id\r\n"
				+ "and Comment.posterUid=Article.posterUid\r\n"
				+ "group by Article.posterUid,Article.header,Article.forumId,Article.updatedTime,Article.viewing";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}

}
