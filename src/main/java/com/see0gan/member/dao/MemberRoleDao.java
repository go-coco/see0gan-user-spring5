package com.see0gan.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.see0gan.member.model.MemberRole;

@Repository
public class MemberRoleDao {
	
	Logger logger = LoggerFactory.getLogger(MemberRoleDao.class);

	private NamedParameterJdbcTemplate jdbc;
	private RowMapper<MemberRole> rowMapper = BeanPropertyRowMapper.newInstance(MemberRole.class);
	private SimpleJdbcInsert insertJdbc;
	
	public MemberRoleDao(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		this.insertJdbc = new SimpleJdbcInsert(dataSource)
				.withTableName("member_role")
				.usingGeneratedKeyColumns("id");
	}
	
	public List<MemberRole> getMemberRolesByEmail(String email) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("email", email);
		
		return jdbc.query(MemberRoleDaoSqls.SELECT_ROLE_BY_EMAIL, paramMap, rowMapper);
	}
	
	public int addMemberRole(Long id, String roleType) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("member_id", id);
		paramMap.put("role_name", "ROLE_"+roleType);
		
		return insertJdbc.execute(paramMap);
	}
	
	public int deleteMemberRole(Long memberId, String roleType) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("member_id", memberId);
		paramMap.put("role_name", "ROLE_"+roleType);
		
		return jdbc.update(MemberRoleDaoSqls.DELETE_BY_USERNAME_ROLEID, paramMap);
	}
	
	public int updateMemberRole(Long memberId, String roleType, String newRole) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("member_id", memberId);
		paramMap.put("role_name", "ROLE_"+roleType);
		paramMap.put("new_role", "ROLE_"+newRole);
		
		return jdbc.update(MemberRoleDaoSqls.UPDATE_BY_USERNAME_ROLEID, paramMap);
	}
	
}
