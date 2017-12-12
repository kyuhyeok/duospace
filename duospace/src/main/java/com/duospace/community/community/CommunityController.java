package com.duospace.community.community;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("community.communityController")
public class CommunityController {
	@Autowired
	private CommunityService service;

	
	@RequestMapping(value="/community/list" , method=RequestMethod.GET)
	public String list() {
		
		return ".community.community.list";
	}
	
	
	//글쓰기 폼
	@RequestMapping(value="/community/created",method=RequestMethod.GET)
	public String createdForm(
			@RequestParam int cateGoryNum,
			@RequestParam String boardName,
			HttpSession session,
			Model model)throws Exception {
		
		
		model.addAttribute("cateGoryNum",cateGoryNum);
		model.addAttribute("boardName",boardName);
		model.addAttribute("mode","created");
		
		return ".community.community.created";
	}
	
	//글쓰기 실행
	@RequestMapping(value="/community/created" ,method=RequestMethod.POST)
	public String createdSubmit(
			Community dto,
			HttpSession session
			)throws Exception {
		
		
		service.insertCommunity(dto);
		
		return "redirect:/community/list";
	}

}
