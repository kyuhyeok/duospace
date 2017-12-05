package com.duospace.duospace.notice;


import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("duospace.noticeController")
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	@RequestMapping(value="/duospace/notice/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page
			,@RequestParam(value="rows", defaultValue="10") int rows
			,@RequestParam(value="searchKey", defaultValue="subject") String searchKey
			,@RequestParam(value="searchValue", defaultValue="") String searchValue
			,Model model
			) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		int dataCount = service.dataCount(map);  //데이터갯수
		
		
		
		
		
		return ".four.duospace.gogeak.notice.list";
	}
	
	@RequestMapping(value="/duospace/notice/created", method=RequestMethod.GET)
	public String createdNotice(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		
		return ".four.duospace.gogeak.notice.created"; //jsp
	}
	
	@RequestMapping(value="/duospace/notice/created", method=RequestMethod.POST)
	public String createdSubmit(Notice dto, HttpSession session) throws Exception{
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+File.separator+"uploads"+File.separator+"notice";
		
		
		service.insertNotice(dto, pathname);
	
		
		return "redirect:/duospace/notice/list";
	}
	
	
}
















