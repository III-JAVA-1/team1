package gusty;

import static org.junit.Assert.*;

import java.io.IOException;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.siftscience.EventRequest;
import com.siftscience.EventResponse;
import com.siftscience.SiftClient;
import com.siftscience.SiftResponse;
import com.siftscience.exception.SiftException;
import com.siftscience.model.CreateOrderFieldSet;
import com.siftscience.model.EventResponseBody;
import com.web.pet.mom.model.Mom;
import com.web.pet.util.MailUtils;

public class Mytest {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() throws Exception {
		
		
		Session session = sessionFactory.getCurrentSession();
		System.out.println("Dao");
		Mom mom = session.get(Mom.class, 2);

		System.out.println(mom.getTitle());
	}

}
