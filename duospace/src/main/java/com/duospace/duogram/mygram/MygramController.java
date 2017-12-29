package com.duospace.duogram.mygram;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.member.SessionInfo;

@Controller("mygram.mygramController")
public class MygramController {
	
	@Autowired
	private MygramService service;
	
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
	
	@RequestMapping(value="/duogram/mygram/created/{blogNum}")
	public String mygramCreatedAdd(
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
		
		return ".duoGram.main.mypagegramcreated";
	}
	
	// 글쓰기
		@RequestMapping(value="/duogram/mygram/insert", method=RequestMethod.POST)
		public String insertGraminfo(
				Mygram dto,
				HttpSession session
				) throws Exception {
			
			SessionInfo info=(SessionInfo)session.getAttribute("user");
			
			dto.setMemberNum(info.getMemberNum());
			service.insertGraminfo(dto);
		
			return "redirect:.duoGram.main.mypagegram";	
		}
}
