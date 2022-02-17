package com.see0gan.member.controller;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;


@RestController
public class KakaoController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String REST_API_KEY = "{YOUR API KEY}";
	private String ACCESS_TOKEN ="";
	private final String ADMIN_KEY = "{YOUR ADMIN KEY}";
	private final RestTemplate restTemplate;
	private final ObjectMapper objectMapper;
	
	public KakaoController(RestTemplate restTemplate, ObjectMapper objectMapper) {
		this.restTemplate = restTemplate;
		this.objectMapper = objectMapper;
	}
	
	@GetMapping(path="/login/getKakaoAuthUrl")
	public @ResponseBody String getKaKatoAuth() {
		
		logger.info("/getKakaoAuthUrl");
		String requestUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id="+REST_API_KEY
				+ "&redirect_uri=http://localhost:8080/login/kakao"
				+ "&response_type=code";
		
		return requestUrl;
	}
	
	@GetMapping(path = "/login/admin")
	public String startApi(@RequestParam("email") String email, @RequestParam("password") String password) {
		
		logger.info("login attempt user with email {} , password {}", email, password);
	
		String requestUrl = 
				"https://kapi.kakao.com/v1/user/ids";
				
		List<Charset> acceptableCharsets = new ArrayList<>();
		acceptableCharsets.add(StandardCharsets.UTF_8);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);		
		headers.setAcceptCharset(acceptableCharsets);
		headers.set("Authorization", "KakaoAK "+ADMIN_KEY);
		
		HttpEntity<Void> request = new HttpEntity<Void>(headers);
	
		ResponseEntity<String> res = restTemplate.exchange(requestUrl, HttpMethod.GET, request, String.class);
		
		logger.info(res.getBody());
		
		
		return requestUrl;
	}
	
	@GetMapping("/login/kakao")
	public String getAccessToken(@RequestParam("code") String AccessToken) {
		
		logger.info("AccessToken: {}", AccessToken);
		
		if(AccessToken != null ) ACCESS_TOKEN = AccessToken;
		
		
		String requestUri = "https://kauth.kakao.com/oauth/token";
	
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		MultiValueMap<String, String> postParam = new LinkedMultiValueMap<>();
		postParam.add("grant_type", "authorization_code");
		postParam.add("client_id", REST_API_KEY);
		postParam.add("redirect_uri", "http://localhost:8080/login/kakao");
		postParam.add("code", AccessToken);
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(postParam, headers);
		
		String result = restTemplate.postForObject(requestUri, request, String.class);
		
	
		Map <String, Object> map = new HashMap<>();
		
		try {
			map = objectMapper.readerFor(new TypeReference<Map<String, Object>>() {}).readValue(result);
		} catch (Exception e) {
			logger.error(e.getMessage());
		} 
		
		ACCESS_TOKEN = (String) map.get("access_token");
		
		
		logger.info("authentication key: "+ ACCESS_TOKEN);
		
		
		requestUri =	"https://kapi.kakao.com/v2/user/me";

		List<Charset> acceptableCharsets = new ArrayList<>();
		acceptableCharsets.add(StandardCharsets.UTF_8);
		
		headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);		
		headers.setAcceptCharset(acceptableCharsets);
		headers.set("Authorization", "Bearer "+ACCESS_TOKEN);
	
		HttpEntity<Void> request1 = new HttpEntity<Void>(headers);
	
		ResponseEntity<String> res = restTemplate.exchange(requestUri, HttpMethod.GET, request1, String.class);
		
		logger.info(res.getBody());
		
		
		return res.getBody();
	}
	
}
