package com.duospace.duogram;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duospace.common.MyUtil;
import com.duospace.member.SessionInfo;

@Controller("duogram.duogramController")
public class DuogramController {
	
	@Autowired
	private DuogramService service;
	
	@Autowired
	private MyUtil util;
	
	// SNS 가입 처리
	@RequestMapping(value="/duogram/snsRegister",
			method=RequestMethod.POST)
	public String snsRegister(
			@RequestParam int register,
			HttpSession session, Model model) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		service.insertAccept(info.getMemberNum());
		return "redirect:/duogram/"+info.getMemberNum();
	}
	
	// SNS 메인 화면
	@RequestMapping(value="/duogram/{blogNum}")
	public String duogram(
			@PathVariable int blogNum,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int countAccept=service.countAccept(blogNum);
		if(countAccept==0) {
			return ".duoGram.acceptcheck";
		}
		
		String me="true";
		if(info.getMemberNum()!=blogNum)
			me="false";
		
		// sns 타임라인 불러오기
		model.addAttribute("me", me);
		model.addAttribute("blogNum", blogNum);
		
		return ".duoGramLayout";
	}
	
	// 글쓰기
	@RequestMapping(value="/duogram/insert", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertBorad(
			Duogram dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("user");

		String state;
		if(info==null) {
			state="loginFail";
		} else {
			dto.setMemberNum(info.getMemberNum());
			service.insertBoard(dto);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;	
	}
	
	// 리스트
	@RequestMapping(value="/duogram/list")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam int blogNum
			) throws Exception {
		
		int rows=10;
		int dataCount;
		int total_page;
		
		Map<String, Object> map=new HashMap<>();
		map.put("blogNum", blogNum);
		
		dataCount=service.dataCount(map);
		total_page = util.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		int listNum, n=0;
		List<Duogram> list=service.listDuogram(map);
		Iterator<Duogram> it=list.iterator();
		while (it.hasNext()) {
			Duogram dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		Map<String, Object> model=new HashMap<>();
		
		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		
		return model;
	}
	
	
	@RequestMapping(value="/bbs/update", 
			method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Duogram dto = service.readGram(num);
		if(dto==null) {
			return "redirect:/bbs/list?page="+page;
		}
			
		if(! info.getUserName().equals(dto.getName())) {
			return "redirect:/bbs/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".bbs.created";
	}

	@RequestMapping(value="/bbs/update", 
			method=RequestMethod.POST)
	public String updateSubmit(
			Duogram dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "bbs";		
	
		// 수정 하기
		service.updateGram(dto, pathname);		
		
		return "redirect:/bbs/list?page="+page;
	}
	
	
	// 삭제
	@RequestMapping(value="/duogram/deleteFile", 
			method=RequestMethod.GET)
	public String deleteFile(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		Duogram dto = service.readGram(num);
		if(dto==null) {
			return "redirect:/duogram/list?page="+page;
		}
			
		if(! info.getUserName().equals(dto.getName())) {
			return "redirect:/duogram/list?page="+page;
		}
		
		return "redirect:/duogram/update?num="+num+"&page="+page;
	}
	
	// 리플
	@RequestMapping(value="/duogram/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			){
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		int count=0;		
		if(info==null) {
			state="loginFail";
		} else {
			dto.setUserName(info.getUserName());
			service.insertReply(dto);
			
			if(dto.getAnswer()!=0)
				count=service.replyCountAnswer(dto.getReplyNum());
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("count", count);
		return model;
	}
}
