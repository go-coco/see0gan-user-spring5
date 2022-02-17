package com.see0gan.member.service;

import com.see0gan.member.model.Member;
import com.see0gan.member.service.security.UserDbService;

public interface MemberService extends UserDbService{

	   public Member addMember(Member member, String memberType);
	   public Member getMemberByEmail(String loginUserId);
	   public Member updateMemberById(String userId);
	   public int deleteMemberByEmail(String loginUserId);
}
