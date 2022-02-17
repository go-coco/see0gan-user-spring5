package com.see0gan.member.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;

import com.see0gan.member.config.ApplicationConfig;
import com.see0gan.member.config.SecurityConfig;


@ContextConfiguration(classes = {ApplicationConfig.class, SecurityConfig.class})
public class PasswordEncoder {
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Test
	public static String encode(String password) {

		System.out.println(PasswordEncoder.encode("123456").matches("$2a$10$YlmkfJo7iMHvom97WsEjMu1dYgMXTJEsyxtN0Q8MBLZtmXQVmTSbK"));
		return null;
	}
	
	/*
	 * @Test public void passwordEncode() throws Exception{
	 * System.out.println(passwordEncoder.encode("1234")); }
	 */

}
