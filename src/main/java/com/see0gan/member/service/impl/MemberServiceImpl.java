package com.see0gan.member.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.member.dao.MemberDao;
import com.see0gan.member.dao.MemberRoleDao;
import com.see0gan.member.model.Member;
import com.see0gan.member.model.MemberRole;
import com.see0gan.member.service.MemberService;
import com.see0gan.member.service.security.UserEntity;
import com.see0gan.member.service.security.UserRoleEntity;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	private final MemberDao memberDao;
	private final MemberRoleDao memberRoleDao;

	public MemberServiceImpl(MemberDao memberDao, MemberRoleDao memberRoleDao) {
		this.memberDao = memberDao;
		this.memberRoleDao = memberRoleDao;
	}
	
	@Override
	public UserEntity getUser(String loginUserId) {
		Member member = memberDao.getMemberByEmail(loginUserId);
		return new UserEntity(member.getEmail(), member.getPassword());
		    
	}

	@Override
	public List<UserRoleEntity> getUserRoles(String loginUserId) {
		List<MemberRole> memberRoles = memberRoleDao.getMemberRolesByEmail(loginUserId);
		List<UserRoleEntity> list = new ArrayList<>();
		
		memberRoles.forEach(role -> {list.add(new UserRoleEntity(loginUserId, role.getRoleName()));});
		
	    return list;
	}
	

	@Override
	public Member addMember(Member member, String memberType) {
		
		if(member==null) throw new RuntimeException("member could not be null");
		
		Long id = memberDao.addMember(member);
		int roleCnt = memberRoleDao.addMemberRole(id, memberType);
		
		if(id==null) throw new RuntimeException("Error : member insert");
		if(roleCnt<1) throw new RuntimeException("Error : memberRole insert");
		
		return member;
		
	}

	@Override
	public Member getMemberByEmail(String loginUserId) {
		Member member = memberDao.getMemberByEmail(loginUserId);
		return member;
	}

	@Override
	public Member updateMemberById(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteMemberByEmail(String loginUserId) {
		return 0;
	//	return memberDao.de;
	}
	

	public int deleteRoleByEmailAndRoleName(String email, String roleName) {

		Long memberId = memberDao.getMemberByEmail(email).getId();
		
		if(memberId == null) throw new RuntimeException("User does not exist in the system");
		
		
		return memberRoleDao.deleteMemberRole(memberId, roleName);
	}
	
	public int updateRoleByEmailAndRoleName(String email, String roleName, String newRole) {

		Long memberId = memberDao.getMemberByEmail(email).getId();
		
		if(memberId == null) throw new RuntimeException("User does not exist in the system");
		
		return memberRoleDao.updateMemberRole(memberId, roleName, newRole);
	}

}
