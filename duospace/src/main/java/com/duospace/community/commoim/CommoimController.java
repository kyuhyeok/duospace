package com.duospace.community.commoim;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("community.commoimController")
public class CommoimController {
	@RequestMapping(value="/community/commoim/commoim",method=RequestMethod.GET)
	public String list() {
		
		return ".community.commoim.commoim";
	}
}
