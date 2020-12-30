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
		query= session.createSQLQuery(hql);
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
		String hql = "select top 10 product.product_name,count(order_item.product_id) as '數量'\n"
				+ "from order_item,product,[dbo].[order]\n"
				+ "where month([dbo].[order].date)=:month\n"
				+ "and order_item.product_id = product.product_id\n"
				+ "and order_item.order_id=[dbo].[order].order_id\n"
				+ "group by product.product_name\n"
				+ "order by count(order_item.product_id) desc";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
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
		String hql = "select Cast(day([dbo].[order].date)as nvarchar)+'日' as '日期',sum([dbo].[order].cost) as '總金額'\n"
				+ "from [dbo].[order]\n"
				+ "where Month([dbo].[order].date)=:month\n"
				+ "group by day([dbo].[order].date)\n"
				+ "order by day([dbo].[order].date)";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	
	@SuppressWarnings("unchecked")//活動顯示發起時間熱度圖表
	public List<Object[]> activehottimeDao(Integer month){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select CAST(Day(NewActNow)as nvarchar) +'日' as '日期',count(Day(NewActNow)) as '活動數量'\n"
				+ "from Active2\n"
				+ "where Active2.viableNumber=1\n"
				+ "and Month(NewActNow)=:month\n"
				+ "group by Day(NewActNow)";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//活動顯示參加人數top3
	public List<Object[]> activejointop3Dao(Integer month){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select top 3 Active2.act_name,count(JoinAct.act_no) as '參加人數'\n"
				+ "from Active2,JoinAct\n"
				+ "where JoinAct.act_no=Active2.act_no\n"
				+ "and month(Active2.NewActNow)=:month\n"
				+ "group by JoinAct.act_no,Active2.act_name\n"
				+ "order by count(JoinAct.act_no) desc";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//活動顯示類型比例
	public List<Object[]> activetypeDao(){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select act_type,count(act_type) as '數量'\n"
				+ "from Active2\n"
				+ "where Active2.viableNumber=1\n"
				+ "group by act_type";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//活動顯示全部活動
	public List<Object[]> activeallDao(){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select active2.act_no,active2.act_name,active2.act_content,active2.NewActNow,active2.act_organize,active2.act_orgman,active2.act_orgphone,active2.act_type,active2.act_where,active2.starttime,active2.endtime,count(JoinAct.act_no) as '報名人數'\n"
				+ "from active2 left join JoinAct\n"
				+ "on active2.viableNumber=1\n"
				+ "and Active2.act_no= JoinAct.act_no \n"
				+ "group by active2.act_no,active2.act_name,active2.act_content,active2.NewActNow,active2.act_organize,active2.act_orgman,active2.act_orgphone,active2.act_type,active2.act_where,active2.starttime,active2.endtime,JoinAct.act_no\n"
				+ "order by Active2.act_no";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}

}
