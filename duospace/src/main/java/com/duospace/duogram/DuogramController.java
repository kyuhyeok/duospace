package com.duospace.duogram;

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
	@RequestMapping(value="/duogram/{memberNum}")
	public String duogram(
			@PathVariable int memberNum,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int countAccept=service.countAccept(memberNum);
		if(countAccept==0) {
			return ".duoGram.acceptcheck";
		}
		
		String me="true";
		if(info.getMemberNum()!=memberNum)
			me="false";
		
		// sns 타임라인 불러오기
		model.addAttribute("me", me);
		
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
			System.out.println("낄낄");
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
	
	@RequestMapping(value="/duogram/list")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page
			) throws Exception {
		int rows=10;
		int dataCount;
		int total_page;
		
		dataCount=service.dataCount();
		total_page = util.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		Map<String, Object> map=new HashMap<>();
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

}
