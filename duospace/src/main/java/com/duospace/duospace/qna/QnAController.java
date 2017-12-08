package com.duospace.duospace.qna;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.member.SessionInfo;

@Controller("duospace.qnaController")
public class QnAController {

	@Autowired
	QnAService service;
	
	@RequestMapping(value="/duospace/qna/list")
	public String listInquery(Model model) throws Exception{
		
		return ".four.duospace.gogeak.qna.list";
	}
	
	
	@RequestMapping(value="/duospace/qna/created", method=RequestMethod.GET)
	public String insertInquery(Model model) throws Exception{
		
		model.addAttribute("mode", "created");
		
		return ".four.duospace.gogeak.qna.created";
	}
	
	
	@RequestMapping(value="/duospace/qna/created", method=RequestMethod.POST)
	public String insertSubmit(
			Qna dto,
			HttpSession session
			) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		dto.setMemberNum(info.getMemberNum());
		
		service.insertQna(dto);
		
		return "redirect:/duospace/qna/list";
	}
	
}
