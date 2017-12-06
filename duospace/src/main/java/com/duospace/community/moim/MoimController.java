package com.duospace.community.moim;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("meeting.moimController")
public class MoimController {
	
	@RequestMapping(value="/community/mymoim/moim",method=RequestMethod.GET)
	public String list(
			Model model
			){	
		
		return ".community.mymoim.moim";
	}
	
	
}
