package com.duospace.duogram.friend;

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

@Controller("duogram.friendController")
public class FriendController {
	@Autowired
	private FriendService service;
	
	@Autowired
	private DuoGramUtil myUtil;
	
	//사람 검색 리스트
	@RequestMapping(value="/duogram/listP", method=RequestMethod.GET)
	public String peoplePage(
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="pagePNo", defaultValue="1") int current_page,
			HttpSession session,
			Model model
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int rows=20;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("memberNum", info.getMemberNum());
		map.put("searchValue", searchValue);
		
		dataCount=service.pDataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Friend> list=service.listPeople(map);
		
		//포워딩할 jsp에 넘길 데이터
		model.addAttribute("list", list);
		model.addAttribute("pDataCount", dataCount);
		model.addAttribute("total_Ppage", total_page);
		model.addAttribute("pagePNo", current_page);
		
		return "duoGram/search/listPeople";
	}
	
	//친구 페이지 로딩
	@RequestMapping(value="/duogram/{blogNum}/f", method=RequestMethod.GET)
	public String friendPage(
			@PathVariable int blogNum,
			HttpSession session,
			Model model
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			state="true";
		}
		//포워딩할 jsp에 넘길 데이터
		model.addAttribute("state", state);
		model.addAttribute("blogNum", blogNum);
		
		return ".userGram.friend.listF";
	}
	
	//친구 리스트(AJAX:TEXT)
	@RequestMapping(value="/duogram/listF", method=RequestMethod.GET)
	public String listF(
			@RequestParam int blogNum,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			HttpSession session,
			Model model
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int rows=20;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("memberNum", info.getMemberNum());
		map.put("blogNum", blogNum);
		
		dataCount=service.fDataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Friend> list=service.listFriend(map);
		
		//포워딩할 jsp에 넘길 데이터
		model.addAttribute("list", list);
		model.addAttribute("memberNum", info.getMemberNum());
		model.addAttribute("fDataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("pageFNo", current_page);
		
		return "duoGram/friend/fCard";
	}
	
	//친구 숫자 : AJAX(JSON)
	@RequestMapping(value="/duogram/readFCnt", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> readFCnt(
			@RequestParam int blogNum,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		int count=0;
		if(info==null) {
			state="loginFail";
		}else {
			Map<String, Object> map=new HashMap<>();
			map.put("blogNum", blogNum);
			
			count=service.fDataCount(map);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("count", count);
		
		return model;
	}
}
