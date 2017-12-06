package com.duospace.duogram;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.member.SessionInfo;

@Controller("duogram.duogramController")
public class DuogramController {
	
	@Autowired
	private DuogramService service;
	
	// SNS 가입 처리
	@RequestMapping(value="/duogram/duogram/snsRegister",
			method=RequestMethod.POST)
	public String snsRegister(HttpSession session, Model model) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		service.insertAccept(info.getMemberNum());
		return "redirect:/duogram/"+info.getMemberNum();
	}
	
	// SNS 메인 화면
	@RequestMapping(value="/duogram/{memberNum}")
	public String duogram(
			@PathVariable int memberNum,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int countAccept=service.countAccept(memberNum);
		if(countAccept==0) {
			return ".duoGram.acceptcheck";
		}
		
		String me="true";
		if(info.getMemberNum()!=memberNum)
			me="false";
		
		// sns 타임라인 불러오기
		
		
		model.addAttribute("me", me);
		
		return ".duoGramLayout";
	}

}
