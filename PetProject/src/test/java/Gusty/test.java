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
	}
}
