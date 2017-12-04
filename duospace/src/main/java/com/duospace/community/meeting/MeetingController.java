package com.duospace.community.meeting;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("meeting.meetingController")
public class MeetingController {
	
	@RequestMapping(value="/community/mymeeting/list",method=RequestMethod.GET)
	public String list(
			@RequestParam(value="page",defaultValue="1")int current_page,
			@RequestParam(value="searchKey",defaultValue="subject")String searchKey,
			@RequestParam(value="searchValue",defaultValue="")String searchValue,
			HttpServletRequest req,
			Model model
			)throws Exception {
		
		//전체 페이지수
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		/*
		dataCount = service.dataCount(map);
		if(dataCount !=0)
			tatal_page=myUtil.pageCount(rows,dataCount);
		*/
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		
        /*
		if(total_page < current_page) 
            current_page = total_page;
		*/
		
		/*
		int start = (current_page -1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		*/
		
		
		
		return ".community.mymeeting.list";
	}
	
	
}
