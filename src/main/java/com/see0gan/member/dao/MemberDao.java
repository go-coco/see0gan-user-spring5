package com.see0gan.member.dao;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.see0gan.member.dto.UserProfile;
import com.see0gan.member.model.Member;

@Repository("dao")
public class MemberDao {

	private NamedParameterJdbcTemplate jdbc;
	private RowMapper<Member> rowMapper = BeanPropertyRowMapper.newInstance(Member.class);
	private SimpleJdbcInsert insertJdbc;
	
	public MemberDao(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		this.insertJdbc  = new SimpleJdbcInsert(dataSource)
				.withTableName("member")
				.usingGeneratedKeyColumns("id");
	}
	
	public Member getMemberByEmail(String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("email", email);
		
		return jdbc.queryForObject(MemberDaoSqls.SELECT_MEMBER_BY_EMAIL, map, rowMapper);
	}
	
	public Long addMember(Member mebmer) {
		SqlParameterSource param = new BeanPropertySqlParameterSource(mebmer);
		return insertJdbc.executeAndReturnKey(param).longValue();
	}

	public int deleteMember(String userId) {
		
		return jdbc.update(MemberDaoSqls.DELETE_BY_EMAIL, Collections.singletonMap("email", userId));

	}
	
	public int updateMember(String userId, UserProfile profile) {
		
		Member foundMember = getMemberByEmail(userId);
		
		if(!Objects.equals(profile.getName(), foundMember.getName()) || profile.getName()!=null) foundMember.setName(profile.getName());
		if(!Objects.equals(profile.getNickname(), foundMember.getNickname()) || profile.getNickname()!=null) foundMember.setNickname(profile.getNickname());
		if(!Objects.equals(profile.getPassword(), foundMember.getPassword()) || profile.getPassword()!=null) foundMember.setPassword(profile.getPassword());
		if(!Objects.equals(profile.getPhone(), foundMember.getPhone()) || profile.getPhone()!=null) foundMember.setPhone(profile.getPhone());
		
		
		return jdbc.update(MemberDaoSqls.UPDATE_BY_EMAIL, new BeanPropertySqlParameterSource(foundMember));

		
	}

	
}
