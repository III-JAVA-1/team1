package com.web.pet.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.store.dto.table.OrderDTO;



@Repository
public class OtherFunctionDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<OrderDTO> shoporderDao(String userid){//會員頁面秀出訂單
		Session session = sessionFactory.getCurrentSession();
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		String hql="select order_id,date,cost,order_status,address,remarks\r\n"
				+ "from [dbo].[order]\r\n"
				+ "where customer_id=:userid\r\n"
				+ "order by date desc";
		Query<OrderDTO> query = session.createNativeQuery(hql).setParameter("userid", userid);
		
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}	
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> shoporderdeatilDao(Integer orderid){//會員頁面秀出訂單詳細資料
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select order_item.product_id,order_item.quantity,product.product_name,product.price \r\n"
				+ "from order_item,product\r\n"
				+ "where order_id=:orderid\r\n"
				+ "and order_item.product_id=product.product_id";
		Query<Object[]> query = session.createNativeQuery(hql).setParameter("orderid", orderid);
		
		list=query.getResultList();
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
		String hql="select product.product_id,product.product_name,product.price,product_image.img\r\n"
				+ "from favorite,product_image,product\r\n"
				+ "where favorite.customer_id=:id\r\n"
				+ "and favorite.product_id=product.product_id\r\n"
				+ "and product.product_id=product_image.product_id\r\n"
				+ "and product.is_display='T'";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public int delteloveDao(String product_id){//會員頁面取消收藏商品
		Session session = sessionFactory.getCurrentSession();
		String hql="delete from favorite where product_id=:id";
		int result = session.createSQLQuery(hql).setParameter("id", product_id).executeUpdate();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> shoprateDao(String user_id){//會員頁面秀出商品評價
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select product.product_name,rate.rate,rate.message,rate.date,rate.customer_id,rate.product_id\r\n"
				+ "from rate,product\r\n"
				+ "where rate.product_id=product.product_id\r\n"
				+ "and rate.customer_id=:id\r\n"
				+ "and product.is_display='T'\r\n"
				+ "order by rate.date desc";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> articlememberDao(Integer user_id,String search){//會員頁面文章記錄
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select Article.header,Article.forumId,Article.updatedTime,Article.viewing,sum(CASE WHEN Comment.posterUid = Article.posterUid THEN 1 ELSE 0 END ) as'留言數',Article.posterUid\r\n"
				+ "from Article,Comment\r\n"
				+ "where Article.isHide=0\r\n"
				+ "and Article.u_Id=:id\r\n"
				+ "and Article.header like '%"+search+"%'\r\n"
				+ "group by Article.posterUid,Article.header,\r\n"
				+ "Article.forumId,Article.updatedTime,Article.viewing\r\n"
				+ "order by Article.updatedTime desc";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	@SuppressWarnings("unchecked") //會員頁面留言
	public List<Object[]> membermessageDao(Integer user_id){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select Article.header,Comment.commentContent,Comment.commentUpdatedtime,Comment.posterUid\r\n"
				+ "from Comment,Article\r\n"
				+ "where Comment.u_Id=:id\r\n"
				+ "and commentIsHide=0\r\n"
				+ "and Comment.posterUid=Article.posterUid\r\n"
				+ "order by Comment.commentUpdatedTime desc";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}

	@SuppressWarnings("unchecked") //會員頁面活動
	public List<Object[]> memberactionDao(Integer user_id,String search){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select act_name,act_content,starttime,endtime,act_where,act_no\r\n"
				+ "from Active2\r\n"
				+ "where u_Id=:id\r\n"
				+ "and viableNumber=1\r\n"
				+ "and act_name like '%"+search+"%'\r\n"
				+ "order by starttime desc";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	@SuppressWarnings("unchecked") //會員頁面參加
	public List<Object[]> memberjoinDao(Integer user_id){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select JoinAct.act_name,JoinAct.extra,join_actnow,JoinAct.pettype,JoinAct.petnum,JoinAct.act_no\r\n"
				+ "from JoinAct,Active2\r\n"
				+ "where JoinAct.u_Id=:id\r\n"
				+ "and Active2.act_no=JoinAct.act_no\r\n"
				+ "and Active2.viableNumber=1";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
}
