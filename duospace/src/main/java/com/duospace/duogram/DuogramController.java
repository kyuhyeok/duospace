package com.duospace.duogram;

import javax.servlet.http.HttpServletRequest;
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
	
	@RequestMapping(value="/duogram/{memberNum}")
	public String duogram(
			@PathVariable int memberNum,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String me="true";
		if(info.getMemberNum()!=memberNum)
			me="false";

		
		model.addAttribute("me", me);
		return ".duoGramLayout";
	}

	
	@RequestMapping(value="/duogram/{memberNum}/created",
			method=RequestMethod.POST)
	public String createdSubmit(@PathVariable int memberNum,HttpServletRequest req, Duogram dto) throws Exception {
		service.insertBoard(dto);
		
		return "duogram/main/main";
	}
	
}
