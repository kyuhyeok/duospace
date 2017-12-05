package com.duospace.duospace.epilogue;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.member.SessionInfo;

@Controller("duospace.epilogueController")
public class epilogueController {
	
	@Autowired
	private epilogueService service;
	
	@RequestMapping(value="/epilogue")
	public String reserve(Model model) throws Exception {
		return ".epilogue.list";
	}
	
	@RequestMapping(value="/duospace/epilogue/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		
		model.addAttribute("mode", "created");
		
		return ".epilogue.e_created";
	}
	
	@RequestMapping(value="/duospace/epilogue/created", method=RequestMethod.POST)
	public String createdSubmit(
			epilogue dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"bbs";
		
		dto.setUserId(info.getUserId());

		service.insertReview(dto, pathname);
		
		return "redirect:/list";
		
	}
}
