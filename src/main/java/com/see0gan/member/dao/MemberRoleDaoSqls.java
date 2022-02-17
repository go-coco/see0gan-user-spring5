package com.see0gan.member.dao;

public class MemberRoleDaoSqls {

	public static final String SELECT_ROLE_BY_EMAIL = "SELECT r.id, r.member_id, r.role_name FROM member_role r JOIN member m ON r.member_id = m.id WHERE email =:email";
	public static final String DELETE_BY_USERNAME_ROLEID = "DELETE FROM member_role WHERE member_id =:member_id and role_name=:role_name";
	public static final String UPDATE_BY_USERNAME_ROLEID = "UPDATE member_role SET role_name =:new_role WHERE member_id =:member_id and role_name=:role_name";

}
