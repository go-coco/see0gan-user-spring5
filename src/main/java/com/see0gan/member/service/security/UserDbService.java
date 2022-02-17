package com.see0gan.member.service.security;

import java.util.List;


public interface UserDbService {
	
	public UserEntity getUser(String email);
	public List<UserRoleEntity> getUserRoles(String userId);

}
