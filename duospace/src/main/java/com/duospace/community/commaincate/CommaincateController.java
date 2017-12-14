package com.duospace.community.commaincate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("comadmin.adminController")
public class CommaincateController {
	@Autowired
	private CommaincateService service;
	@Autowired
	
	@RequestMapping(value="/commaincate/admin", method=RequestMethod.GET)	
	public String adminForm(){
		
		return ".community.commaincate.admin";
	}
	
		
	
	@RequestMapping(value="/community/commaincate")
	public String commaincateForm() {
		
		return ".community.commaincate.commaincate";
	}
	
	@RequestMapping(value="/commaincate/submit",method=RequestMethod.POST)
	public String commaincateSubmit(
			Commaincate dto
			)throws Exception {
		
		service.insertCommaincate(dto);
		
		return "redirect:/commaincate/admin";
	}
	
	@RequestMapping(value="/commaincate/delete",method=RequestMethod.GET)
	public String deleteCommaincate() {
		
		
		return "redirect:/commaincate/admin";
	}
	
}
