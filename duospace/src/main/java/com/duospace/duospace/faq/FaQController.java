package com.duospace.duospace.faq;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("duospace.faqController")
public class FaQController {

	@RequestMapping(value="/faq")
	public String reserve(Model model) throws Exception {
		return "";
	}
}