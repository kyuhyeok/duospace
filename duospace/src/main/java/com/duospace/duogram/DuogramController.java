package com.duospace.duogram;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("duogram.duogramController")
public class DuogramController {
	@Autowired
	private DuogramService service;

	@RequestMapping(value="/duogram/created",
			method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return ".duoGram.created";
	}
	
	@RequestMapping(value="/duogram/created",
			method=RequestMethod.POST)
	public String createdSubmit(HttpServletRequest req, Duogram dto) throws Exception {
		service.insertBoard(dto);
		
		return "duogram/main/main";
	}
	
	@RequestMapping(value="/duogram")
	public String list(Model model) throws Exception {
		return ".duoGramLayout";
	}
}
