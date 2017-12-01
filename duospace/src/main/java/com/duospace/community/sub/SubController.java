package com.duospace.community.sub;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("community.subController")
public class SubController {
	@RequestMapping(value="/community/sub/maderoom",method=RequestMethod.GET)
	public String list() {
		
		return ".community.sub.maderoom";
	}
}
