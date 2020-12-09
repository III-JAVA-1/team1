package Henry.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import Henry.dao.Salon_reservDAO;
import Henry.model.Salon_reservBean;
import util.HibernateUtils;

public class Salom_Service {

	SessionFactory factory = HibernateUtils.getSessionFactory();
	Salon_reservDAO dao = new Salon_reservDAO();

	public int save(Salon_reservBean salon_reservBean) {
		int count = 0;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			count = dao.save(salon_reservBean);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			if (tx != null) {
				tx.rollback();
			}
		}
		return count;

	}

}
