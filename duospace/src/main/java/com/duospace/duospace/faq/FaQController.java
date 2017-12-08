package com.duospace.duospace.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.admin.faq.Faq;

@Controller("duospace.faqController")
public class FaQController {

	@Autowired
	FaQService service;
	
	@RequestMapping(value="/duospace/faq")
	public String list(
			@RequestParam(value="qnaCode", defaultValue="1") int qnaCode,
			Model model) throws Exception {

	
		List<Faq> list= service.listFaq();
		List<Faq> qnaList = service.listQnaCate();
		
		model.addAttribute("qlist",qnaList);     //qna분류 리스트
		model.addAttribute("list", list);  //faq리스트
		
		
		return ".four.duospace.gogeak.faq.faq";
	}
	
	

	
	
}


