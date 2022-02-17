package com.see0gan.member.dao;

public class SpaceDaoSqls {
	
	public static final String SELECT_ALL ="SELECT name, type,	intro1,	intro2,	capacity, guide, caution, url, img1, img2, addr, addr2, create_date, modify_date, member_id FROM space";
	public static final String SELECT_ALL_BY_TYPE ="SELECT name, type,	intro1,	intro2,	capacity, guide, caution, url, img1, img2, addr, addr2, create_date, modify_date, member_id FROM space WHERE type= :type";
	public static final String SELECT_ALL_BY_NAME ="SELECT name, type,	intro1,	intro2,	capacity, guide, caution, url, img1, img2, addr, addr2, create_date, modify_date, member_id FROM space WHERE name= :name";
	public static final String SELECT_SPACE_BY_ID ="SELECT name, type,	intro1,	intro2,	capacity, guide, caution, url, img1, img2, addr, addr2, create_date, modify_date, member_id FROM space WHERE id= :id";
	public static final String UPDATE_SPACE_BY_ID ="UPDATE space SET name=:name, type=:type, intro1=:intro1,	intro2=:intro2,	capacity=:capacity, guide=:guide, caution=:caution, url=:url, img1=:img1, img2=:img2, addr=:addr, addr2=:addr2, modify_date = CURDATE() WHERE id= :id";
	public static final String DELETE_SPACE_BY_ID ="DELETE FROM space WHERE id= :id";

}
