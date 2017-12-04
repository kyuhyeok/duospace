package com.duospace.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("duospace.member.memberController")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//로그인 및 로그아웃--------------
	@RequestMapping(value="/duospace/member/login", method=RequestMethod.GET)
	public String loginForm() throws Exception{
		return ".member.login";
	}
	
	@RequestMapping(value="/duospace/member/login", method=RequestMethod.POST)
	public String loginSubmit(
			@RequestParam String userId,
			@RequestParam String userPwd,
			Model model,
			HttpSession session
			) {
		
		Member dto =service.readMember(userId);  //userId는 이메일임. 
		
		if(dto==null || (! dto.getPwd().equals(userPwd))) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}
		
		//로그인 날짜 변경
		service.updateLastLogin(dto.getEmail());
		
		//로그인 정보를 세션에 저장
		SessionInfo info = new SessionInfo();
		info.setUserId(dto.getEmail());
		info.setUserName(dto.getName());
		session.setAttribute("member", info);
		
		String uri = (String)session.getAttribute("preLoginURI");  //이전에 들럿던 주소
		
		if(uri==null)
			uri="redirect:/";
		else
			uri="redirect:"+uri;
		
		session.removeAttribute("preLoginURI");
		
		return "uri";
	}
}































