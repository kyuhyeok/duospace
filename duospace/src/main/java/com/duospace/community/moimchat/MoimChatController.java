package com.duospace.community.moimchat;

import java.util.HashMap;
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

import com.duospace.duogram.freq.DuoGramUtil;
import com.duospace.member.SessionInfo;

@Controller("moim.moimChatController")
public class MoimChatController {
	@Autowired
	private MoimChatService service;
	
	@Autowired
	private DuoGramUtil myUtil;
	
	@RequestMapping(value="/moim/chat", method=RequestMethod.POST)
	public String main(
			@PathVariable int cmoimCode,
			@RequestParam String friendNum,
			@RequestParam String name,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			state="true";
		}
		model.addAttribute("state", state);
		model.addAttribute("friendNum", friendNum);
		model.addAttribute("name", name);
		
		return "community/moimChat/moimChat";
	}
	
	//모임메신저 리스트(AJAX:TEXT)
	@RequestMapping(value="/moim/listMCC", method=RequestMethod.POST)
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
		
		List<MoimChat> list=service.listFMC(map);
		
		//포워딩할 jsp에 넘길 데이터
		model.addAttribute("list", list);
		model.addAttribute("total_page", total_page);
		model.addAttribute("pageNo", current_page);
		
		return "duoGram/fMess/fMCard";
	}
	
	//안읽은 메세지 tot : AJAX(JSON)
	@RequestMapping(value="/moim/fMURtDCnt", method=RequestMethod.POST)
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
			map.put("friendNum", 0);
			count=service.fMURtDCnt(map);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("count", count);
		
		return model;
	}
	
	//모임 메시지들(AJAX:JSON)
	@RequestMapping(value="/moim/listmChat", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listmChatContent(
			@RequestParam int cmoimCode,
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int rows=10;
		
		Map<String, Object> map=new HashMap<>();
		map.put("memberNum", info.getMemberNum());
		map.put("cmoimCode", cmoimCode);
		map.put("mchatNum", 0);
		
		int dataCount=service.fMCListDataCount(map);
		int total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		List<MoimChat> list=null;
		map.put("start", start);
		map.put("end", end);
		list=service.listFMessContent(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		model.put("totalpage", total_page);
		
		return model;
	}
}
