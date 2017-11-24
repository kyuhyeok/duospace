package com.duospace.admin.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.member.memberController")
public class MemberController {
	@RequestMapping(value="/admin/member/member")
	public String list(Model model) throws Exception {
		return ".admin4.menu1.member.member";
	}
	
}
