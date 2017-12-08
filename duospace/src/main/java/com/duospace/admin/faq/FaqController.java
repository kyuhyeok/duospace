package com.duospace.admin.faq;


import java.util.List;

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

	
		List<Faq> list= service.listFaq();
		List<Faq> qnaList = service.listQnaCate();
		
		model.addAttribute("qlist",qnaList);
		model.addAttribute("list", list);
		
		
		return ".admin4.menu3.faq.faqlist";
	}
	
	@RequestMapping(value="/admin/faq/created", method=RequestMethod.GET)
	public String insertFaq(@RequestParam(value="qnaCode", defaultValue="1")int qnaCode,
							Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		model.addAttribute("qnaCode", qnaCode);
		
		return ".admin4.menu3.faq.faqcreated";
	}
	
	@RequestMapping(value="/admin/faq/created", method=RequestMethod.POST)
	public String insertSubmit(Faq dto) throws Exception {
		
		service.insertFaq(dto);

		return "redirect:/admin/faq/list?qnaCode="+dto.getQnaCode();
	}
	
	@RequestMapping(value="/admin/faq/update", method=RequestMethod.GET)
	public String updateFaq(@RequestParam int num,
			@RequestParam int qnaCode,
			Model model) throws Exception {

		Faq dto = service.readFaq(num);
		if(dto==null) {
			return "redirect:/admin.faq.list";
		}
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);

		return ".admin4.menu3.faq.faqcreated";
	}

	@RequestMapping(value="/admin/faq/update", method=RequestMethod.POST)
	public String updateSubmit(Faq dto) throws Exception {

		service.updateFaq(dto);
		
		return "redirect:/admin/faq/list?qnaCode="+dto.getQnaCode();
	}
	@RequestMapping(value="/admin/faq/delete", method=RequestMethod.GET)
	public String deleteFaq(@RequestParam int num) throws Exception {

		service.deleteFaq(num);

		return "redirect:/admin/faq/list";
	}
}
