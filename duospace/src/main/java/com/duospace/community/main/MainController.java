package com.duospace.community.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.member.SessionInfo;

@Controller("community.mainController")
public class MainController {
	
	@RequestMapping(value="/community/{memberNum}",method=RequestMethod.GET)
	public String list(
			@PathVariable int memberNum,
			HttpSession session,
			Model model
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String me="true";
		if(info.getMemberNum()!=memberNum)
			me="false";
		model.addAttribute("me", me);
		model.addAttribute("moimNum", memberNum);
		
		
		return ".communityLayout";
	}	
	
}
