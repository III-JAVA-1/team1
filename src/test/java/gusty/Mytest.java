package gusty;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class Mytest {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() throws Exception {
		
		System.out.println(DigestUtils.sha512Hex("www123"));
		System.out.println(DigestUtils.sha512Hex("qqq456"));
		System.out.println(DigestUtils.sha512Hex("zx123456"));
		System.out.println(DigestUtils.sha512Hex("5566"));
		System.out.println(DigestUtils.sha512Hex("a12345"));
	}

}
