package Gusty.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import Gusty.model.MemberBean;
import Gusty.util.HibernateUtils;



public class MemberHibernateDao {
	
	SessionFactory factory = HibernateUtils.getSessionFactory();
	
	public int save(MemberBean mb) {
		int count=0;
		Session session = factory.getCurrentSession();
		session.save(mb);
		count++;
		return count;
	}

}
