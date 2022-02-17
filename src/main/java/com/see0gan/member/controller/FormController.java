package com.see0gan.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/forms")
public class FormController {
	
	@GetMapping(path = "/login")
	public String getLoginForm(Model model) {

		model.addAttribute("type", "guest");
		model.addAttribute("type_ko", "게스트");
		return "members/loginform";
	}

	@GetMapping("/join")
	public String joinform(Model model) {
		model.addAttribute("type", "게스트");
		return "members/joinform";
	}
	
	@GetMapping(path = "/register")
	public String getBasicInfoForm() {
		return "space/basicInfoForm";
	}
	
	@GetMapping(path="host/login")
	public String getLoginform(Model model) {
		
		model.addAttribute("type", "host");
		model.addAttribute("type_ko", "호스트");
		
		return "members/loginform";
	}
	
	@GetMapping(path="host/join")
	public String getJoinform(Model model) {
		
		model.addAttribute("type", "호스트");
		
		return "members/joinform";
	}
	
	

}
