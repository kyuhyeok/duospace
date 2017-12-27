package com.duospace.duogram.mygram;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duospace.member.SessionInfo;

@Controller("mygram.mygramController")
public class MygramController {
	
	
	@RequestMapping(value="/duogram/mygram/{blogNum}")
	public String mygram(
			@PathVariable int blogNum,
			Mygram dto,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info= (SessionInfo)session.getAttribute("user");

		String me="true";
		if(info.getMemberNum()!=blogNum)
			me="false";
		
		model.addAttribute("me", me);
		model.addAttribute("dto", dto);
		model.addAttribute("blogNum", blogNum);
		
		return ".duoGram.main.mypagegram";
	}
	
	
}
