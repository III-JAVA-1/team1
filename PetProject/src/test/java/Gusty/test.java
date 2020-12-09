package Gusty;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import Gusty.dao.MemberHibernateDao;
import Gusty.model.MemberBean;
import util.HibernateUtils;

public class test {

	private MemberHibernateDao memberHibernateDao;
	SessionFactory factory = HibernateUtils.getSessionFactory();

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			
			MemberBean memberBean = session.get(MemberBean.class, 1);
			System.out.println(memberBean);
			
			tx.commit();
			System.out.println(memberBean.getAddress());
		}catch (Exception ex) {
			if(tx != null) {
				tx.rollback();
			}
			ex.printStackTrace();
		}
	}

}
