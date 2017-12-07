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
	
	
	
	@RequestMapping(value="/moim/freeboard",method=RequestMethod.GET)
	@ResponseBody
	public String list(Model model) {
		
		return ".community.mymoim.freeboard";
	}
	
	
	
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
			dto.setWriter(info.getUserId());
			service.insertFreeboard(dto);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}	
	
	@RequestMapping(value="/freeboard/list")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value="pageNo",defaultValue="1") int current_page
			)throws Exception{
		int rows=10;
		int dataCount;
		int total_page;
		
		dataCount=service.dataCount();
		total_page = util.pageCount(rows,dataCount);
		if(current_page>total_page)
			current_page=total_page;
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		Map<String, Object> map = new HashMap<>();
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
			n++;
		}
		
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		
		return model;
		
	}
}
