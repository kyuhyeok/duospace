package com.duospace.duogram;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("duogram.duogramController")
public class DuogramController {
	
	@RequestMapping(value="/duogram")
	public String list(Model model) throws Exception {
		return "duoGram/main";
	}
}
