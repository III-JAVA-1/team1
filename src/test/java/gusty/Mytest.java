package gusty;

import static org.junit.Assert.*;

import java.io.IOException;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.siftscience.EventRequest;
import com.siftscience.EventResponse;
import com.siftscience.SiftClient;
import com.siftscience.SiftResponse;
import com.siftscience.exception.SiftException;
import com.siftscience.model.CreateOrderFieldSet;
import com.siftscience.model.EventResponseBody;
import com.web.pet.util.MailUtils;

public class Mytest {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() throws IOException, AddressException, MessagingException {
		
		String s = UUID.randomUUID().toString();
		System.out.println(s.substring(0,s.indexOf("-")));
		MailUtils.sendMail("a0985209465@gmail.com", "你的新密碼:"+s.substring(0,s.indexOf("-")));
		
	}

}
