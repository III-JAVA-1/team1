package Henry.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import Henry.model.Salon_reservBean;
import util.HibernateUtils;

public class Salon_reservDAO {

	SessionFactory factory = HibernateUtils.getSessionFactory();

	public int save(Salon_reservBean salon_reservBean) {

		int count = 0;
		Session session = factory.getCurrentSession();
		session.save(salon_reservBean);
		count++;
		return count;

	}


}
