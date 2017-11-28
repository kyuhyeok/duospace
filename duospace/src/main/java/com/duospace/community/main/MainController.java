package com.duospace.community.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("community.mainController")
public class MainController {

	@RequestMapping(value="/community",method=RequestMethod.GET)
	public String method(){
		
		return ".communityLayout";
	}
}
