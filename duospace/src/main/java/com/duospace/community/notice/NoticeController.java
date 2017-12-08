package com.duospace.community.notice;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("community.noticeController")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/community/notice/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		model.addAttribute("mode", "created");
		return ".community.notice.created";
	}
	
	@RequestMapping(value="/community/notice/created", method=RequestMethod.POST)
	public String createdSubmit(HttpServletRequest req, Notice dto) throws Exception{
			
		service.insertNotice(dto);
		
		return "redirect:/community/notice/list";
	}
	@RequestMapping(value="/community/notice/list")
	public String list(HttpServletRequest req, 
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page =0;
		int dataCount =0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page -1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Notice> list= service.listNotice(map);
		
		int listNum, n=0;
		Iterator<Notice> it=list.iterator();
		while(it.hasNext()) {
			Notice data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		String query = "";
		String listUrl;
		String articleUrl;
		if(searchValue.length()!=0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		listUrl = cp+"/community/notice/list";
		articleUrl = cp+"/community/notice/article?page=" + current_page;
		if(query.length()!=0) {
			listUrl = listUrl + "?" + query;
			articleUrl = articleUrl + "&"+ query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		
		return ".community.notice.list";
	}
	@RequestMapping(value="/community/notice/article",
			method=RequestMethod.GET)
	public String article(
			@RequestParam(value="noticenum") int noticenum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue",defaultValue="") String searchValue,
			Model model
			) throws Exception{
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		service.updateHitCount(noticenum);
		
		Notice dto= service.readNotice(noticenum);
		if(dto==null)
		
		return "redirect:/community/notice/list?page="+page;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("noticenum", noticenum);
		
		Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);
		
		String query = "page="+page;
		if(searchValue.length()!=0) {
			query +="&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".community.notice.article";
	}
	
	@RequestMapping(value="/community/notice/update", method=RequestMethod.POST)
	public String updateSubmit(Notice dto, @RequestParam String page) throws Exception{
		
		service.updateNotice(dto);
		
		return "redirect:/notice/list?page="+page;
	}
}


