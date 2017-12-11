package com.duospace.community.commaincate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("comadmin.adminController")
public class CommaincateController {
	@RequestMapping(value="/commaincate/admin", method=RequestMethod.GET)
	
	public String main() {
		
		return ".community.commaincate.admin";
	}
}
