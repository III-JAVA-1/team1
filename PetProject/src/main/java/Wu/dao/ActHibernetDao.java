package Wu.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import Wu.model.ActBean;
import util.HibernateUtils;

public class ActHibernetDao {
	SessionFactory factory = HibernateUtils.getSessionFactory();
	
	public int save (ActBean actbean) {
		int count=0;
		Session session = factory.getCurrentSession();
		session.save(actbean);
		count++;
		return count;
	}
}
