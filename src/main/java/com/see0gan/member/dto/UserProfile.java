package com.see0gan.member.dto;

public class UserProfile {
	
	private String name;
	private String nickname;
	private String phone;
	private String email;
	private String password;
	
	public UserProfile() {}
	
	public UserProfile(String name, String nickname, String phone, String email, String password) {
		super();
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.email = email;
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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

}
