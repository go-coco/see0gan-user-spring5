package com.see0gan.member.dao;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.see0gan.member.model.Space;

@Repository
public class SpaceDao {

	private SimpleJdbcInsert jdbcInsert;
	private NamedParameterJdbcTemplate jdbcTemplate;
	private RowMapper<Space> rowMapper = BeanPropertyRowMapper.newInstance(Space.class);
	
	public SpaceDao(DataSource dataSource) {
		this.jdbcInsert = new SimpleJdbcInsert(dataSource)
				.withTableName("space")
				.usingGeneratedKeyColumns("id");
		this.jdbcTemplate= new NamedParameterJdbcTemplate(dataSource);
	}
	
	public List<Space> getSpaceByType(String type){
		Map<String, String> param = new HashMap<>();
		param.put("type", type);
	
		return 	jdbcTemplate.query(SpaceDaoSqls.SELECT_ALL_BY_TYPE, param, rowMapper);
	
	}
	
	public List<Space> getSpaceList(){
	
		return 	jdbcTemplate.query(SpaceDaoSqls.SELECT_ALL, rowMapper);
	
	}
	
	public Optional<Space> getSpaceById(String id){
		
		return 	Optional.ofNullable(jdbcTemplate.query(SpaceDaoSqls.SELECT_SPACE_BY_ID, 
				Collections.singletonMap("id", id), rowMapper).get(0));
		
	
	}
	
	public Long addSpace(Space space) {
		
		SqlParameterSource param = new BeanPropertySqlParameterSource(space);
		return jdbcInsert.executeAndReturnKey(param).longValue();
	}
	
	public int updateSpaceById(Long id, Space space) {
		SqlParameterSource param = new BeanPropertySqlParameterSource(space);
		return jdbcTemplate.update(SpaceDaoSqls.UPDATE_SPACE_BY_ID, param);
		
	}
	
	public int deleteSpaceById(String id) {
	
		return jdbcTemplate.update(SpaceDaoSqls.DELETE_SPACE_BY_ID, Collections.singletonMap("space_id", id));
		
	}
}
