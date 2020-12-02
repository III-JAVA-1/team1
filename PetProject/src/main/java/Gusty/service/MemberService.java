package Gusty.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Gusty.dao.MemberHibernateDao;
import Gusty.model.MemberBean;
import Gusty.util.HibernateUtils;

public class MemberService {
	
	SessionFactory factory = HibernateUtils.getSessionFactory();
	MemberHibernateDao dao = new MemberHibernateDao();
	
	public int save(MemberBean mb){
		int result=0;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx=session.beginTransaction();
			result=dao.save(mb);
			tx.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			if(tx!=null) {
				tx.rollback();
			}
			e.printStackTrace();
		}
		return result;
			
	}
	

	
	
	
}
