package utils;

import static org.junit.Assert.*;

import org.junit.Test;

public class JiaJieMiTest {

	@Test
	public void testGet3DESEncrypt() {
		String pwd = "qwert123";
		String key = "hhhhhh";
		String pwd2 = JiaJieMi.get3DESEncrypt(pwd, key);
		System.out.println(pwd2); 
		System.out.println(JiaJieMi.get3DESDecrypt(pwd2, key));
	}

	@Test
	public void testGet3DESDecrypt() {
		fail("Not yet implemented");
	}

}
