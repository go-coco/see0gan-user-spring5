package com.see0gan.member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.see0gan.member.model.Member;
import com.see0gan.member.service.MemberService;
import com.see0gan.member.service.security.UserEntity;
import com.see0gan.member.service.security.UserRoleEntity;

@Controller
@RequestMapping(path = "/api/users")
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private final MemberService memberService;
	private final PasswordEncoder passwordEncoder;
	private final ObjectMapper objectMapper;

	public MemberController(MemberService memberService, PasswordEncoder passwordEncoder, ObjectMapper objectMapper) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
		this.objectMapper = objectMapper;
	}

	@PostMapping(path = "/join/{type}")
	public String join(@ModelAttribute Member member, @PathVariable String type) {

		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberService.addMember(member, type);

		return "redirect:main/index_2";
	}

	@GetMapping("/token/refresh")
	public void refreshToken(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String authorizationHeader = request.getHeader(HttpHeaders.AUTHORIZATION);

		response.setContentType(MediaType.APPLICATION_JSON_VALUE);

		if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {

			String token = authorizationHeader.substring("Bearer ".length());
			Algorithm algorithm = Algorithm.HMAC256("secretByte".getBytes());
			JWTVerifier verifier = JWT.require(algorithm).build();
			DecodedJWT decodedJWT = verifier.verify(token);
			String username = decodedJWT.getSubject();
			UserEntity user = memberService.getUser(username);
			List<UserRoleEntity> roles = memberService.getUserRoles(username);

			String access_token = JWT.create().withSubject(user.getLoginUserId())
					.withExpiresAt(new Date(System.currentTimeMillis() + 10 * 60 * 1000))
					.withIssuer(request.getRequestURL().toString())
					.withClaim("roles", roles.stream().map(UserRoleEntity::getRoleName).collect(Collectors.toList()))
					.sign(algorithm);

			String refresh_token = JWT.create().withSubject(user.getLoginUserId())
					.withExpiresAt(new Date(System.currentTimeMillis() + 30 * 60 * 1000))
					.withIssuer(request.getRequestURL().toString()).sign(algorithm);

			Map<String, String> tokens = new HashMap<>();
			tokens.put("access_token", access_token);
			tokens.put("refresh_token", refresh_token);
			try {
				objectMapper.writeValue(response.getOutputStream(), tokens);
			} catch (Exception e) {
				logger.error("Error logging in : {}", e.getMessage());
				response.setHeader("error", e.getMessage());
				Map<String, String> error = new HashMap<>();
				error.put("error_message", e.getMessage());
				objectMapper.writeValue(response.getOutputStream(), error);

			}

		} else {
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			objectMapper.writeValue(response.getOutputStream(), "refresh token is missing");

		}

	}

}
