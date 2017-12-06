package com.duospace.admin.faq;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.faqController")
public class FaqController {
	
	@RequestMapping(value="/admin/faq/list")
	public String list(Model model) throws Exception {

		return ".admin4.menu3.faq.faqlist";
	}
	
	@RequestMapping(value="/admin/faq/created", method=RequestMethod.GET)
	public String insertFaq(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		
		return ".admin4.menu3.faq.faqcreated";
	}
	
}
