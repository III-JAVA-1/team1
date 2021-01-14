package com.web.pet.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.support.moneta.MonetaCodec;
import com.web.pet.member.model.Member;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.PetMomOrder;
import com.web.pet.petshop.model.PetshopBean;
import com.web.pet.store.dto.table.OrderDTO;



@Repository
public class OtherFunctionDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<OrderDTO> shoporderDao(String userid){//會員頁面秀出訂單
		Session session = sessionFactory.getCurrentSession();
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		String hql="select order_id,date,cost,order_status,address,remarks,pay_type\r\n"
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
				+ "and product.is_display='T'\r\n"
				+ "order by product.product_id";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
		
	}
	
	public int delteloveDao(String product_id,Integer user_id){//會員頁面取消收藏商品
		Session session = sessionFactory.getCurrentSession();
		String hql="delete from favorite where product_id=:id and customer_id=:uid";
		int result = session.createSQLQuery(hql).setParameter("id", product_id).setParameter("uid", user_id).executeUpdate();
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
	
	/////////////////////////會員商城功能////////////////////////////////	
	
	@SuppressWarnings("unchecked")
	public List<Object[]> articlememberDao(Integer user_id){//會員頁面文章記錄
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select Article.header,Article.forumId,Article.updatedTime,Article.viewing,sum(CASE WHEN Comment.posterUid = Article.posterUid THEN 1 ELSE 0 END ) as'留言數',Article.posterUid\r\n"
				+ "from Article,Comment\r\n"
				+ "where Article.isHide=0\r\n"
				+ "and Article.u_Id=:id\r\n"
				+ "and Article.header like '%%'\r\n"
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
	
	@SuppressWarnings("unchecked")//會員頁面文章收藏
	public List<Object[]> memberlovearticleDao(Integer user_id){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select Article.header,Article.forumId,Article.updatedTime,Article.viewing,ArticleFavorite.posterUid\r\n"
				+ "from ArticleFavorite,Article\r\n"
				+ "where ArticleFavorite.posterUid=Article.posterUid\r\n"
				+ "and Article.isHide=0\r\n"
				+ "and ArticleFavorite.u_Id=:id";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("id", user_id);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	public int deletelovearticleDao(Integer posteruid,Integer user_id) {//會員頁面刪除收藏文章
		int result=0;
		Session session = sessionFactory.getCurrentSession();
		String hql="delete \r\n"
				+ "from ArticleFavorite\r\n"
				+ "where posterUid=:pid\r\n"
				+ "and u_Id=:uid";
		result=session.createSQLQuery(hql).setParameter("pid", posteruid).setParameter("uid", user_id).executeUpdate();
		return result;
	}
	
	/////////////////////////會員論壇功能////////////////////////////////	

	@SuppressWarnings("unchecked") //會員頁面活動
	public List<Object[]> memberactionDao(Integer user_id){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select Active2.act_name,Active2.act_content,Active2.starttime,Active2.endtime,act_where,Active2.act_no , sum( case when JoinAct.act_no=Active2.act_no then 1 else 0 end) as '參加人數'\r\n"
				+ "from Active2 , JoinAct\r\n"
				+ "where Active2.u_Id=:id\r\n"
				+ "and viableNumber=1\r\n"
				+ "and Active2.act_name like '%%'\r\n"
				+ "group by Active2.act_name,Active2.act_content,Active2.starttime,Active2.endtime,act_where,Active2.act_no\r\n"
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
	
	@SuppressWarnings("unchecked") //會員頁面活動的參加人
	public List<Object[]> memberalljoinDao(Integer aid){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select name,email,country,district,address,pettype,petnum,join_actnow,extra,act_name\r\n"
				+ "from JoinAct\r\n"
				+ "where act_no=:aid";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("aid", aid);
		list = query.list();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	/////////////////////////會員活動功能////////////////////////////////	
	
	@SuppressWarnings("unchecked") //會員頁面店家預約
	public List<Object[]> memberpetshopDao(Integer user_id){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select storename,date,name,phone,item,address,id,other\r\n"
				+ "from Salon_reserv\r\n"
				+ "where fk_id=:user_id\r\n"
				+ "and storename like '%%'";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("user_id", user_id);
		list = query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	public Integer memberpetshopdeleteDao(Integer id){//會員店家刪除訂單
		Integer result =0;
		Session session = sessionFactory.getCurrentSession();
		String hql="delete \r\n"
				+ "from Salon_reserv\r\n"
				+ "where id=:id";
		result = session.createSQLQuery(hql).setParameter("id", id).executeUpdate();
		return result;
	}
	
	/////////////////////////會員店家功能////////////////////////////////
	
	@SuppressWarnings("unchecked") //會員頁面保母資料修改顯示修改資料
	public List<Object[]> membermomDao(Integer user_id){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select momId,bodyType1,bodyType2,bodyType3,bodyType4,experience,notices,petContent,proPrice1,proPrice2,proPrice3,title\r\n" + 
				"from mom\r\n" + 
				"where uId=:user_id";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("user_id", user_id);
		list = query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	public Mom getoneMomDao(Integer mid) {//取得一筆保母物件
		Session session = sessionFactory.getCurrentSession();
		return session.get(Mom.class, mid);
	}
	
	public Integer membereditmomDao(Mom mom){//會員保母資料修改
		Session session = sessionFactory.getCurrentSession();
		Integer result=0;
		session.merge(mom);
		result++;
		return result;
	}
	
	@SuppressWarnings("unchecked") //會員頁面我的保母訂單
	public List<Object[]> mymomorderDao(Integer mid){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select country,district,address,chooseStart,chooseEnd,service,total,status,orderId \r\n"
				+ "from PetMomOrder\r\n"
				+ "where momId=:mid";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("mid", mid);
		list = query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	@SuppressWarnings("unchecked") //會員頁面保母訂單寵物詳細資料
	public List<Object[]> mymomorderpetdetailDao(Integer oid){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select petName,petGender,petBreed,petAge,petType,remark\r\n"
				+ "from PetMomOrder\r\n"
				+ "where orderId=:oid";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("oid", oid);
		list = query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	public PetMomOrder momorderacceptDao(Integer oid) {//取得一筆保母訂單物件
		Session session = sessionFactory.getCurrentSession();
		return session.get(PetMomOrder.class, oid);
	}
	
	public Integer momorderaccepteditDao(PetMomOrder petMomOrder) {//預約成功修改訂單狀態
		Integer result=0;
		Session session = sessionFactory.getCurrentSession();
		session.merge(petMomOrder);
		result++;
		return result;
	}
	
	public Integer rejectmomorderDao(Integer oid) {//預約拒絕並修改訂單狀態
		Integer result=0;
		Session session = sessionFactory.getCurrentSession();
		String hql="update PetMomOrder \r\n"
				+ "set status='拒絕'\r\n"
				+ "where orderId=:oid";
		result = session.createQuery(hql).setParameter("oid",oid).executeUpdate();
		return result;
	}
	
	@SuppressWarnings("unchecked") //會員頁面我預約的保母訂單資料
	public List<Object[]> othermomorderDao(Integer uid){
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> list = new ArrayList<Object[]>();
		String hql="select country,district,address,chooseStart,chooseEnd,service,status,total,orderId\r\n"
				+ "from PetMomOrder\r\n"
				+ "where uid=:uid";
		Query<Object[]> query = session.createSQLQuery(hql).setParameter("uid", uid);
		list = query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list; 
		}
	}
	
	/////////////////////////會員保母功能////////////////////////////////
}
