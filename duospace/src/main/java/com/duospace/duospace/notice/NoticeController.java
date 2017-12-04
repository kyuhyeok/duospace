package com.duospace.duospace.notice;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("duospace.noticeController")
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	@RequestMapping(value="/duospace/notice/list")
	public String list() throws Exception {
		
		return ".four.duospace.gogeak.notice.list";
	}
	
	@RequestMapping(value="/duospace/notice/created", method=RequestMethod.GET)
	public String createdNotice(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		
		return ".four.duospace.gogeak.notice.created"; //jsp
	}
	
	@RequestMapping(value="/duospace/notice/created", method=RequestMethod.POST)
	public String createdSubmit(
			Notice dto,
			HttpSession session
			) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+File.separator+"uploads"+File.separator+"notice";
		
		
		service.insertNotice(dto, pathname);
	
		
		return "redirect:/four/duospace/gogeak/notice/list";
	}
	
}
















