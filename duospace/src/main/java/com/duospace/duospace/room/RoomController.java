package com.duospace.duospace.room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("duospace.roomController")
public class RoomController {
	
	@RequestMapping(value="/reserveRoom")
	public String reserve() throws Exception{
		
		return ".room.reserve";
	}
}
