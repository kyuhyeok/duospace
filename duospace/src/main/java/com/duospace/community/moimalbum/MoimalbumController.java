package com.duospace.community.moimalbum;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
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
import com.duospace.member.SessionInfo;

@Controller("moimalbum.moimalbumController")
public class MoimalbumController {

		@Autowired
		private MoimalbumService service;
		@Autowired
		private DuospaceUtil myUtil;
		
		@RequestMapping(value="/moimalbum/list")
		public String list(
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				HttpServletRequest req,
				Model model) throws Exception{
			
			String cp = req.getContextPath();
			
			int rows=6;
			int total_page;
			int dataCount;
			
			if(req.getMethod().equalsIgnoreCase("GET")) {
				searchValue = URLDecoder.decode(searchValue,"utf-8");
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			
			dataCount = service.dataCount(map);
			total_page = myUtil.pageCount(rows, dataCount);
			
			if (total_page < current_page)
				current_page = total_page;
		
			int start = (current_page - 1) * rows + 1;
			int end = current_page * rows;
			
			map.put("start", start);
			map.put("end", end);
			
			List<Moimalbum> list = service.listMoimalbum(map);
		
				
			String query ="";
			String listUrl = cp+"/moimalbum/list";
			String articleUrl =cp+"/moimalbum/article?page=" + current_page;
			if(searchValue.length()!=0) {
				query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
				
			}
			
			if(query.length()!=0) {
				listUrl = cp+"/moimalbum/list?" +query;
				articleUrl = cp+"/moimalbum/article?page=" + current_page +"&" + query;
			}
			
			String paging =myUtil.pagingMethod(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("page", current_page);
			model.addAttribute("paging", paging);
			
			return ".community.moimalbum.list";
	}
		
		@RequestMapping(value="/moimalbum/created", method=RequestMethod.GET)
		
		public String createdForm(
				HttpSession session,
				Model model) throws Exception{
			
			SessionInfo info=
					(SessionInfo)session.getAttribute("user");
			if(info==null) {
				return "redirect:/moimalbum/login";
			}
			model.addAttribute("mode", "created");
			return ".community.moimalbum.created";
		}
			
		@RequestMapping(value="/moimalbum/created", method=RequestMethod.POST)
		public String createdSubmit(
				Moimalbum dto,
				HttpSession session) throws Exception{
			String root=session.getServletContext().getRealPath("/");
			String path=root+File.separator+"uploads"+File.separator+"moimalbum";
			
			SessionInfo info=(SessionInfo)session.getAttribute("user");
			if(info==null) {
				return "redirect:/moimalbum/login";
			}
			
			dto.setMemberNum(info.getMemberNum());
			
			// 수정 ------------////////////////////////////////////////////////
			dto.setCmoimCode(7);
			
			service.insertMoimalbum(dto, path);
			
			return "redirect:/moimalbum/list";
		}
		
		
		@RequestMapping(value="/moimalbum/article", method=RequestMethod.GET)
		public String article(
				@RequestParam(value="alnum") int alnum,
				@RequestParam(value="page") String page,
				@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				Model model) throws Exception {
			
			
			Moimalbum dto = service.readMoimalbum(alnum);
			if(dto==null) {
				return "redirect:/moimalbum/list?page="+page;
			}
		
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			map.put("alnum", alnum);
			
			Moimalbum preReadDto = service.preReadMoimalbum(map);
			Moimalbum nextReadDto = service.nextReadMoimalbum(map);
			
			int countLikeMoimalbum=service.countLikeMoimalbum(alnum);
			
			String query ="page=" +page;
			if(searchValue.length()!=0) {
				query += "&searchKey=" + searchKey + "searchValue=" + URLEncoder.encode(searchValue, "utf-8");
				
			}
			
			model.addAttribute("subMenu", "3");
			
			model.addAttribute("dto", dto);
			model.addAttribute("preReadDto", preReadDto);
			model.addAttribute("nextReadDto", nextReadDto);
			model.addAttribute("countLikeMoimalbum", countLikeMoimalbum);
			
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			return ".community.moimalbum.article";
}
		@RequestMapping(value="/moimalbum/update", method=RequestMethod.GET)
		public String updateForm(
				@RequestParam int alnum,
				@RequestParam String page,
				HttpSession session, Model model) throws Exception {
			
			SessionInfo info=(SessionInfo)session.getAttribute("user");
			if(info==null) {
				return "redirect:/moimalbum/login";
			}
			
			Moimalbum dto = service.readMoimalbum(alnum);
			if (dto == null)
				return "redirect:/moimalbum/list?page="+page;
			
			if(dto.getMemberNum()!=info.getMemberNum()) {
				return "redirect:/moimalbum/list?page="+page;
			}
			
			model.addAttribute("subMenu", "3");
			
			model.addAttribute("dto", dto);
			model.addAttribute("page", page);
			model.addAttribute("mode", "update");
			
			
			return ".community.moimalbum.created";
		}
		
		@RequestMapping(value="/moimalbum/update", method=RequestMethod.POST)
		public String updateSubmit(
				Moimalbum dto,
				String page,
				HttpSession session) throws Exception {
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+File.separator+"uploads"+File.separator+"moimalbum";
			
			SessionInfo info=(SessionInfo)session.getAttribute("user");
			if(info==null) {
				return "redirect:/moimalbum/login";
			}
			
			service.updateMoimalbum(dto, pathname);
			
			
			return "redirect:/moimalbum/article?alnum="+dto.getAlnum()+"&page="+page;
			
		}
		
		@RequestMapping(value="/moimalbum/delete", method=RequestMethod.GET)
		public String delete(
				@RequestParam int alnum,
				@RequestParam String page,
				HttpSession session) throws Exception{
			
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+File.separator+"uploads"+File.separator+"moimalbum";
			
			SessionInfo info=(SessionInfo)session.getAttribute("user");
			if(info==null) {
				return "redirect:/moimalbum/login";
			}
			
			Moimalbum dto = service.readMoimalbum(alnum);
			if(dto==null)
				return "redirect:/moimalbum/list?page="+page;

			service.deleteMoimalbum(alnum, dto.getImageFile(), pathname);
			
			return "redirect:/moimalbum/list?page="+page;
		}
		
		@RequestMapping(value="/moimalbum/listReply")
		public String listReply(
				
				@RequestParam int alnum,
				@RequestParam(value="pageNo", defaultValue="1") int current_page,
				Model model) throws Exception{
			
			int rows=5;
			int total_page=0;
			int dataCount=0;
			
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("alnum", alnum);
			
			int start=(current_page-1)*rows+1;
			int end=current_page*rows;
			map.put("start", start);
			map.put("end", end);
			List<Reply> listReply=service.listReply(map);
			
			Iterator<Reply> it=listReply.iterator();
			int listNum, n=0;
			while(it.hasNext()) {
				Reply dto=it.next();
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
				n++;
			}
			
			model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("total_page", total_page);
			
			return "community/moimalbum/listReply";
		}
}
