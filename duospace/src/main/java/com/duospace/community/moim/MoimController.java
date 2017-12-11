package com.duospace.community.moim;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("meeting.moimController")
public class MoimController {

	//방안에 쿼리 다여기서..
	
	@RequestMapping(value="/community/moim/moim",method=RequestMethod.GET)
	public String moimpage(
			HttpSession session,
			@RequestParam int cmoimCode,
			Model model
			)throws Exception{
		
		model.addAttribute("cmoimCode",cmoimCode);
		
		return ".community.moim.moim";
	}
	
	
	
	
	
}
