package com.duospace.duospace.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("duospace.mainController")
public class MainController {
	@RequestMapping(value="/space_main", method=RequestMethod.GET)
	public String method() {
		return ".duospaceLayout";
	}
}
