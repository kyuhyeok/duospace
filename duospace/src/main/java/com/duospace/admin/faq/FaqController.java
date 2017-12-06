package com.duospace.admin.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("admin.faqController")
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	@RequestMapping(value="/admin/faq/list")
	public String list(
			@RequestParam(value="qnaCode", defaultValue="1") int qnaCode,
			Model model) throws Exception {

		Map<String, Object> map = new HashMap<>();
		
		map.put("qnaCode", qnaCode);
		List<Faq> list= service.listFaq(map);
		
		model.addAttribute("list", list);
		
		
		return ".admin4.menu3.faq.faqlist";
	}
	
	@RequestMapping(value="/admin/faq/created", method=RequestMethod.GET)
	public String insertFaq(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		
		return ".admin4.menu3.faq.faqcreated";
	}
	
	@RequestMapping(value="/admin/faq/created", method=RequestMethod.POST)
	public String insertSubmit(Faq dto) throws Exception {
		
		service.insertFaq(dto);

		return "redirect:/admin/faq/list";
	}
	
}
