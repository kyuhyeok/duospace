package com.duospace.duogram;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class DuogramController {
	@Controller("duogram.duogramController")
	public class MemberController {
		@RequestMapping(value="/duoGram/main")
		public String list(Model model) throws Exception {
			return ".duoGram.main";
		}
	}
}
