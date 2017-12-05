package com.duospace.community.meeting;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.member.SessionInfo;

@Controller("meeting.meetingController")
public class MeetingController {
	
	@RequestMapping(value="/community/mymeeting/meeting",method=RequestMethod.GET)
	public String list(Model model){	
		
		return ".community.mymeeting.meeting";
	}
	/*리스트 좀있다가..
	@RequestMapping(value="/meeting/list")
	@RequestBody
	public Map<String, Object> list(
			@RequestParam(value="pageNo",defaultValue="1")int current_page) throws Exception
			{
		int rows=5;
		int dataCount=service.dataCount();
		int total_page=myUtil.pageCount(rows,dataCount);
		if(current_page>total_page)
			current_page=total_page;
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		
		int listNum,n=0;
		List<Meeting> list=service.listGuest(map);
		Iterator<Meeting> it=list.iterator();
		while(it.hasNext()) {
			Meeting dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			listNum = dataCount -(start + n - 1);
			dto.setlistNum(listNum);
			n++;
		}
		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("total_page", total_page);
		model.put("dataCount", dataCount);
		model.put("pageNo", current_page);
		model.put("list", list);
		
		return model;
	}
	*/
	/*
	@RequestMapping(value="/meeting/insert",method=RequestMethod.POST)
	public Map<String, Object> createdSubmit(
			Meeting dto,
			HttpSession session)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("userId");
		String state;
		if(info==null) {
			state="loginFail";
		}else {
			dto.setMoimnum(info.getUserId());
			service.insertMeeting(dto);
			state="true";
		}
		Map<String, Object>model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	*/
	
}
