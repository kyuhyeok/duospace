package com.duospace.community.freeboard;

import java.util.HashMap;
import java.util.Iterator;
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

import com.duospace.common.MyUtil;
import com.duospace.member.SessionInfo;

@Controller("freeboard.freeboardcontroller")
public class FreeboardController {
	@Autowired
	private FreeboardService service;
	@Autowired
	private MyUtil util;	
	
	@RequestMapping(value="/freeboard/insertFreeboard",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFreeboard(
			Freeboard dto,
			HttpSession session
			){
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		if(info==null) {
			state="loginFail";
		}else {
			dto.setWriter(info.getMemberNum());
			service.insertFreeboard(dto);
			
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}	
	
	//TEXT
	@RequestMapping(value="/freeboard/list")
	public String list(
			@RequestParam(value="cmoimCode") int cmoimCode,
			@RequestParam(value="pageNo",defaultValue="1") int current_page,
			Model model
			)throws Exception{
		int rows=5;
		int dataCount=0;
		int total_page=0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("cmoimCode", cmoimCode);
		
		dataCount=service.dataCount(map);
		total_page = util.pageCount(rows,dataCount);
		if(current_page>total_page)
			current_page=total_page;
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		int listNum,n=0;
		List<Freeboard> list = service.listFreeboard(map);
		Iterator<Freeboard> it=list.iterator();
		
		while (it.hasNext()) {
			Freeboard dto = it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			//System.out.println(dto.getContent());
			n++;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("pageNo",current_page);
		
		return "community/moim/listFreeboard";
		
	}
	
	
	//댓글등록
	@RequestMapping(value="/freeboard/insertReply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			@RequestParam int cmoimCode,
			Reply dto,
			HttpSession session,
			Model model
			){
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		} else {
			dto.setMemberNum(info.getMemberNum());
			service.insertReply(dto);
			dto.setContent(dto.getContent().replace("\n", "<br>"));
			state="true";
		}
		
		Map<String, Object> map=new HashMap<>();
		map.put("state", state);
		
		model.addAttribute("cmoimCode",cmoimCode);
		
		return map;
	}
	
	
	//댓글 리스트 TEXT방식.
	@RequestMapping(value="/freeboard/listReply")
	public String listReply(
			@RequestParam int boardNum,
			Model model
			)throws Exception{
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardNum", boardNum);
		List<Reply> listReply=service.listReply(map);
		
			for(Reply dto : listReply) {
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}
		model.addAttribute("listReply",listReply);
		return "community/moim/listReply";
	}
	
	//게시글 삭제
	@RequestMapping(value="/freeboard/deleteFreeboard")
	@ResponseBody
	public Map<String, Object> deleteFreeboard(
			@RequestParam int boardNum,
			HttpSession session
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		service.deleteFreeboard(boardNum, info.getMemberNum());
		Map<String, Object> map = new HashMap<>();
		map.put("boardNum",boardNum);
		
		return map;
	}
	
}
