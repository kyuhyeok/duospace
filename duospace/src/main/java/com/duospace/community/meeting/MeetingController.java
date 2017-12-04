package com.duospace.community.meeting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("meeting.meetingController")
public class MeetingController {
	
	@RequestMapping(value="/community/mymeeting/list",method=RequestMethod.GET)
	public String list() {
		return ".community.mymeeting.list";
	}
}
