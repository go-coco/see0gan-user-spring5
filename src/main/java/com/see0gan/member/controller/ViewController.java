package com.see0gan.member.controller;

import java.security.Principal;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;


import com.see0gan.member.model.Member;
import com.see0gan.member.service.MemberService;

@Controller
public class ViewController {

	private final MemberService memberService;

	public ViewController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping(path = "/index")
	public String getMain() {

		return "main/index_2";
	}

	@GetMapping(path = "/hostCenter")
	public String getHostCenter() {
		return "main/hostCenter";
	}

	@GetMapping(path = "/mypage")
	public String getMypage(Principal principal, ModelMap modelMap) {
		String loginId = principal.getName();
		System.out.println(loginId);
		Member member = memberService.getMemberByEmail(loginId);
		modelMap.addAttribute("member", member);
		return "members/memberinfo";
	}

}
