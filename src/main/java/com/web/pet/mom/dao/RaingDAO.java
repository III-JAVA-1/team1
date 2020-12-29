package com.web.pet.mom.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.mom.model.Raing;

@Repository
public class RaingDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public void insertRaingDao(Raing raing) { //新增評論
		Session session = sessionFactory.getCurrentSession();
		session.save(raing);
	}
	
	
	public List<Raing> ajaxSearchRaing(int uId) { //查詢一筆評論
		List<Raing> list = new ArrayList<>();
		String hql = "FROM Raing WHERE momId = :uId";
		Query<Raing> query = sessionFactory.getCurrentSession().createQuery(hql).setParameter("momId",uId);
		list = query.getResultList();
		return list;
	}
	
	public int updateRaing(Raing raing) {//修改評論
		int count =0;
		Session session = sessionFactory.getCurrentSession();
		session.update(raing);
		count++;
		return count;
	}
	
	public int deleteRaing(Raing raing) {//刪除評論
		int count =0;
		Session session = sessionFactory.getCurrentSession();
		session.delete(raing);
		count++;
		return count;
	}
	
	
}
