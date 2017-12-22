package com.duospace.community.moimcalendar;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

@Controller("calendar.CalendarController")
public class MoimCalendarController {
	@Autowired
	private MoimCalendarService service;
	@Autowired
	private MyUtil util;
	
	//TEXT
	@RequestMapping(value="/community/moim{cmoimCode}/moimcalendar")
	public String main(
			@PathVariable int cmoimCode,
			@RequestParam(value="pageNo",defaultValue="1") int current_page,
			HttpServletRequest request,
			Model model
			)throws Exception {
		
		int newLine = 0;
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;

		now.set(year, month - 1, 1); // 출력할 년도, 월로 설정

		year = now.get(Calendar.YEAR); // 변화된 년, 월
		month = now.get(Calendar.MONTH) + 1;

		int cend = now.getActualMaximum(Calendar.DAY_OF_MONTH); // 해당월의 마지막 날짜
		int w = now.get(Calendar.DAY_OF_WEEK);    //1~7(일~토)
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("cmoimCode", cmoimCode);
		
		int dataCount=service.dataCount(map);
		int rows=5;
		int total_page = util.pageCount(rows,dataCount);
		if(current_page>total_page)
			current_page=total_page;
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		
		int listNum,n=0;
		List<MoimCalendar> list =service.listMoimCalendar(map);
		Iterator<MoimCalendar> it=list.iterator();
		while(it.hasNext()) {
			MoimCalendar dto = it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("pageNo",current_page);
	
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("cend",cend);
		model.addAttribute("w",w);
		model.addAttribute("newLine",newLine);
		
		return "community/moimcalendar/main";
	}
	
	@RequestMapping(value="/moimCalendar/insertMoimCalendar",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertMoimCalendar(
			MoimCalendar dto,
			HttpSession session
			){
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		if(info==null) {
			state="loginFail";
		}else {
			dto.setWriter(info.getMemberNum());
			service.insertMoimCalendar(dto);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}	
	
}
