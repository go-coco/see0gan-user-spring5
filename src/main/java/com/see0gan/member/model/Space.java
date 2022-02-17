package com.see0gan.member.model;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;

public class Space {

	private Long id;
	private String name;
	private String type; 
	private String intro1; 
	private String intro2;
	private String capacity; 
	private String guide;
	private String caution; 
	private String url;
	private String img1;
	private String img2; 
	private String addr;
	private String addr2;
	@JsonSerialize(using = LocalDateSerializer.class)
	private LocalDate createDate;
	@JsonSerialize(using = LocalDateSerializer.class)
	private LocalDate modifyDate;
	private String member_id;

	public Space() {
		createDate = LocalDate.now();
		modifyDate = LocalDate.now();
	}
	
	public Space(String name, String type, String intro1, String intro2, String capacity, String guide, String caution,
			String url, String img1, String img2, String addr, String addr2, String member_id) {
		this();
		this.name = name;
		this.type = type;
		this.intro1 = intro1;
		this.intro2 = intro2;
		this.capacity = capacity;
		this.guide = guide;
		this.caution = caution;
		this.url = url;
		this.img1 = img1;
		this.img2 = img2;
		this.addr = addr;
		this.addr2 = addr2;
		this.member_id = member_id;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIntro1() {
		return intro1;
	}

	public void setIntro1(String intro1) {
		this.intro1 = intro1;
	}

	public String getIntro2() {
		return intro2;
	}

	public void setIntro2(String intro2) {
		this.intro2 = intro2;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	public String getCaution() {
		return caution;
	}

	public void setCaution(String caution) {
		this.caution = caution;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	@JsonFormat(pattern = "yyyy-MM-dd")
	@JsonProperty("createDate")
	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}
	@JsonFormat(pattern = "yyyy-MM-dd")
	@JsonProperty("modifyDate")
	public LocalDate getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(LocalDate modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
