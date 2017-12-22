package com.duospace.duospace.epilogue;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.member.SessionInfo;

@Controller("duospace.epilogueController")
public class epilogueController {
	
	@Autowired
	private epilogueService service;
	
	@RequestMapping(value="/epilogue")
	public String list(Model model) throws Exception {
		return ".epilogue.list";
	}
	
	@RequestMapping(value="/duospace/epilogue/created", method=RequestMethod.GET)
	public String createdForm(
			@RequestParam int reservNum,
			@RequestParam String spotName,
			Model model) throws Exception{
		model.addAttribute("reservNum", reservNum);
		model.addAttribute("spotName", spotName);
		model.addAttribute("mode", "created");
		
		return ".userSpace.epilogue.e_created";
	}
	
	@RequestMapping(value="/duospace/epilogue/created", method=RequestMethod.POST)
	public String createdSubmit(
			epilogue dto,
			@RequestParam int reservNum,
			Model model,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"bbs";
		
		dto.setMemberNum(info.getMemberNum());
		dto.setReservNum(reservNum);
		
		service.insertReview(dto, pathname);
		
		return "redirect:/mypage";
	}
	
	
}
