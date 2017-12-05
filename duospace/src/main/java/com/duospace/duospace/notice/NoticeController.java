package com.duospace.duospace.notice;


import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.common.DuospaceUtil;

@Controller("duospace.noticeController")
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	@Autowired
	private DuospaceUtil myUtil;
	
	@RequestMapping(value="/duospace/notice/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page
			,@RequestParam(value="rows", defaultValue="10") int rows
			,@RequestParam(value="searchKey", defaultValue="subject") String searchKey
			,@RequestParam(value="searchValue", defaultValue="") String searchValue
			,HttpServletRequest req
			,Model model
			) throws Exception {
		
		String cp=req.getContextPath();
		
		Map<String, Object> map = new HashMap<>();
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue,"UTF-8");
		}
			
		int total_page=0;
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		int dataCount = service.dataCount(map);  //데이터갯수
	
		
		if(dataCount!=0) {
			total_page=myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page<current_page)
			current_page=total_page;
		
		
		//리스트에 출력할 데이터 가져오기
		int start = (current_page-1)*rows + 1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		//글리스트
		List<Notice> list = service.listNotice(map);
		
		List<Notice> listTop = null;
		if(current_page==1)
			listTop=service.listNoticeTop();
		
		//리스트의 번호
		int listNum, n=0;
		for(Notice dto:list) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String query ="";
		String listUrl= cp+"/duospace/notice/list";
		String articleUrl=cp+"/duospace/notice/article?page="+current_page;
		if(searchValue.length()!=0) {
			query="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
			
		}
		
		if(query.length()!=0) {
			listUrl=cp+"/duospace/notice/list?"+query;
			articleUrl=cp+"/duospace/notice/article?page="+current_page+"&"+query;
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, listUrl);
		
		model.addAttribute("mode", "created");
		model.addAttribute("listTop", listTop);
		model.addAttribute("paging", paging);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("total_page", total_page);
		model.addAttribute("rows", rows);
		
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
	
	@RequestMapping(value="/duospace/notice/article")
	public String readNotice(
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="num") int num,
			@RequestParam(value="rows", defaultValue="10") String rows,
			@RequestParam(value="page") String page,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		//String cp = req.getContextPath();
		
		service.updateHitCount(num);
		
		Notice dto = service.readNotice(num);
		
		if(searchValue.length()!=0) {
			searchValue=URLDecoder.decode(searchValue,"utf-8");
		}
		
		if(dto==null) {
			return "redirect:/duospace/notice/list?page="+page;
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("num", num);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		Notice preDto=service.preReadNotice(map);
		Notice nextDto=service.nextReadNotice(map);
		
		
		
		
		String query="page="+page+"&rows="+rows;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("dto", dto);
		model.addAttribute("rows", rows);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("preDto", preDto);
		model.addAttribute("nextDto", nextDto);

		
		
		
		return ".four.duospace.gogeak.notice.article";
	}
	
	@RequestMapping(value="/duospace/notice/update", method=RequestMethod.GET)
	public String updateNotice(
			@RequestParam(value="num") int num,
			@RequestParam(value="page")String page,
			Model model
			) throws Exception{
		
		Notice dto = service.readNotice(num);
		if(dto==null)
			return "redirect:/duospace/notice/list?page="+page;
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		
		return ".four.duospace.gogeak.notice.created";
	}
	
	@RequestMapping(value="/duospace/notice/update", method=RequestMethod.POST)
	public String updateSuibmit(Notice dto, @RequestParam String page, HttpSession session) throws Exception{
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+File.separator+"uploads"+File.separator+"notice";
		
		service.updateNotice(dto, pathname);
		
		return "redirect:/duospace/notice/list?page="+page;
	}
}
















