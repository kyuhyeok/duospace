package com.duospace.duogram.freq;

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

import com.duospace.member.SessionInfo;

@Controller("duogram.fReqController")
public class FReqController {
	@Autowired
	private FReqService service;
	
	@Autowired
	private DuoGramUtil myUtil;
	
	//친구 요청에 대한 수락 : AJAX(JSON)
	@RequestMapping(value="/duogram/insertFResp", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFResp(
			FReq dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			dto.setMemberNum(info.getMemberNum());
			
			service.insertFResp(dto);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	//친구 요청 리스트(AJAX:TEXT)
	@RequestMapping("/duogram/listFReq")
	public String listFReq(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			HttpSession session,
			Model model
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("to", info.getMemberNum());
		
		dataCount=service.fReqDataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<FReq> listFReq=service.listFReq(map);
		
		//포워딩할 jsp에 넘길 데이터
		model.addAttribute("listFR", listFReq);
		model.addAttribute("fReqCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("pageNo", current_page);
		
		return "duoGram/fReq/fRCard";
	}
	
	//친구 요청 숫자 : AJAX(JSON)
	@RequestMapping(value="/duogram/readFReqCnt", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> readFReqCnt(
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		int count=0;
		if(info==null) {
			state="loginFail";
		}else {
			Map<String, Object> map=new HashMap<>();
			map.put("to", info.getMemberNum());
			
			count=service.fReqDataCount(map);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("count", count);
		
		return model;
	}
	
	//친구 요청 거부 : AJAX(JSON)
	@RequestMapping(value="/duogram/deleteFResp", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFResp(
			FReq dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			dto.setMemberNum(info.getMemberNum());
			
			service.deleteFResp(dto);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	//친구 요청 : AJAX(JSON)
	@RequestMapping(value="/duogram/insertFReq", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFReq(
			FReq dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			dto.setMemberNum(info.getMemberNum());
			
			service.insertFReq(dto);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	//친구 요청 취소 : AJAX(JSON)
	@RequestMapping(value="/duogram/deleteFReq", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFReq(
			FReq dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			dto.setMemberNum(info.getMemberNum());
			
			service.deleteFReq(dto);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	//친구 취소 : AJAX(JSON)
	@RequestMapping(value="/duogram/deleteFreind", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFreind(
			FReq dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			dto.setMemberNum(info.getMemberNum());
			
			service.deleteFreind(dto);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
}
