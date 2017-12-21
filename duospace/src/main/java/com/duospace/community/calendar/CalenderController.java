package com.duospace.community.calendar;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("calendar.CalendarController")
public class CalenderController {
	
	//TEXT
	@RequestMapping(value="/community/moim{cmoimCode}/calendar")
	public String main(
			@PathVariable int cmoimCode,
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

		int end = now.getActualMaximum(Calendar.DAY_OF_MONTH); // 해당월의 마지막 날짜
		int w = now.get(Calendar.DAY_OF_WEEK);    //1~7(일~토)
		
		
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("end",end);
		model.addAttribute("w",w);
		model.addAttribute("newLine",newLine);
		
		return "community/calendar/main";
	}
}
