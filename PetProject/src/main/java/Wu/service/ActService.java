package Wu.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Wu.dao.ActHibernetDao;
import Wu.model.ActBean;
import util.HibernateUtils;

public class ActService {
	SessionFactory factory = HibernateUtils.getSessionFactory();
	ActHibernetDao dao= new ActHibernetDao();
	
	
	public int save (ActBean actbean) {
		int count =0;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			dao.save(actbean);
			count++;
			tx.commit();

		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
			ex.printStackTrace();
		}
				
		return count;
		
	}
}
