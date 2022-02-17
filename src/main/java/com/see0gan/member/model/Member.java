package com.see0gan.member.model;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.see0gan.member.service.security.CustomUserDetails;

@Component
public class Member extends CustomUserDetails {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String name;
	private String nickname;
	private String phone;
	private String email;
	private String password;
	private Date createDate;
	private Date modifyDate;
	
	public Member() {
		createDate = new Date();
		modifyDate = new Date();
	}
	
	public Member(Long id, String name, String nickname, String phone, String email, String password) {
		super();
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.email = email;
		this.password = password;
	}
	

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	
}
