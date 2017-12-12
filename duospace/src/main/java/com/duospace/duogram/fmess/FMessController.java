package com.duospace.duogram.fmess;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duospace.duogram.freq.DuoGramUtil;
import com.duospace.member.SessionInfo;

@Controller("duogram.fMessController")
public class FMessController {
	@Autowired
	private FMessService service;
	
	@Autowired
	private DuoGramUtil myUtil;
	
	//메신저 친구 리스트(AJAX:TEXT)
	@RequestMapping(value="/duogram/listFMC", method=RequestMethod.POST)
	public String listFMess(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session,
			Model model
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("memberNum", info.getMemberNum());
		dataCount=service.listFMCDataCount(map);
		
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<FMess> list=service.listFMC(map);
		
		//포워딩할 jsp에 넘길 데이터
		model.addAttribute("list", list);
		model.addAttribute("total_page", total_page);
		model.addAttribute("pageNo", current_page);
		
		return "duoGram/fMess/fMCard";
	}
	
	//안읽은 메세지 tot : AJAX(JSON)
	@RequestMapping(value="/duogram/fMURtDCnt", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> fMURtDCnt(
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		int count=0;
		if(info==null) {
			state="loginFail";
		}else {
			Map<String, Object> map=new HashMap<>();
			map.put("memberNum", info.getMemberNum());
			
			count=service.fMURtDCnt(map);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("count", count);
		
		return model;
	}
	
	//메시지 보내기 : AJAX(JSON)
	@RequestMapping(value="/duogram/insertFMess", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFMess(
			FMess dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			dto.setMemberNum(info.getMemberNum());
			
			service.insertFMess(dto);
			
			state="true";
		}
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	//해당 친구 메시지들(AJAX:TEXT)
	@RequestMapping(value="/duogram/listFMess", method=RequestMethod.POST)
	public String listFMessContent(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam int friendNum,
			HttpSession session,
			Model model
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("memberNum", info.getMemberNum());
		map.put("friendNum", friendNum);
		
		dataCount=service.fMCListDataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<FMess> list=service.listFMessContent(map);
		
		//포워딩할 jsp에 넘길 데이터
		model.addAttribute("list", list);
		model.addAttribute("fMDC", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		
		return "duoGram/fMess/messCon";
	}
	
	//메시지 읽음 : AJAX(JSON)
	@RequestMapping(value="/duogram/updateReadDate", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateReadDate(
			@RequestParam int num,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			Map<String, Object> map=new HashMap<>();
			map.put("num", num);
			service.updateReadDate(map);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	//메시지 삭제 : AJAX(JSON)
	@RequestMapping(value="/duogram/deleteFMess", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFMess(
			FMess dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			dto.setMemberNum(info.getMemberNum());
			
			service.deleteFMess(dto);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
}
