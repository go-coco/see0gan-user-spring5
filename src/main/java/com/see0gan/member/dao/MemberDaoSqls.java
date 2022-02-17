package com.see0gan.member.dao;

public class MemberDaoSqls {

	public static final String SELECT_MEMBER_BY_EMAIL = "SELECT id, name, email, password, create_date, modify_date FROM member WHERE email = :email";
	public static final String UPDATE_BY_EMAIL = "UPDATE member SET name= :name, email= :email, password = :password, create_date, modify_date = DATETIME() FROM member WHERE email = :email";
	public static final String DELETE_BY_EMAIL = "DELETE FROM member WHERE email= :email";


}
