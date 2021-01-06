package com.web.pet.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.member.model.Member;


@Repository
public class MemberDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void insertMemberDao(Member member) {//會員註冊
		Session session = sessionFactory.getCurrentSession();
		session.save(member);
	}
	
	@SuppressWarnings("unchecked")
	public List<Member> ajaxloginDao(){//取得全部會員資料做註冊AJAX判斷
		List<Member> list = new ArrayList<Member>();
		String hql = "FROM Member";
		Query<Member> query= sessionFactory.getCurrentSession().createQuery(hql);
		list=query.getResultList();
		//System.out.println(list);
		return list;	
	}
	
	@SuppressWarnings("unchecked")
	public List<Member> ajaxloginDao(int user_id){//取得一筆完整會員資料作Header AJAX
		List<Member> list = new ArrayList<Member>();
		String hql = "FROM Member where u_Id = :userid";
		Query<Member> query= sessionFactory.getCurrentSession().createQuery(hql).setParameter("userid",user_id);
		list=query.getResultList();
		return list;	
	}
	
	@SuppressWarnings("unchecked")
	public List<Member> loginDao(String useremail,String password){//用登入資訊驗證
		List<Member> list = new ArrayList<Member>();
		Session session=sessionFactory.getCurrentSession();
		String hql = "select u_Id FROM Member where email = :useremail and password = :password";
		Query<Member> query = session.createQuery(hql).setParameter("useremail",useremail).setParameter("password", password);
		list=query.getResultList();
		if(list.isEmpty()){
			return null;
		}
		else {
			
			return list;
		}
	}
	
	public Member fullmemberDao(Integer id){//取得登入的member物件
		Session session = sessionFactory.getCurrentSession();
		return session.get(Member.class,id);
	}
	
	public int uploadimgDao(Member member) { //上傳更新資料庫圖片
		int count =0;
		Session session = sessionFactory.getCurrentSession();
		session.merge(member);
		count++;
		return count;
	}
	
	public int updatememberDao(Member member) {//更新會員基本資料
		int count =0;
		Session session = sessionFactory.getCurrentSession();
		session.merge(member);
		count++;
		return count;
	}
		
}
