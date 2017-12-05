package com.duospace.duospace.room;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("duospace.roomController")
public class RoomController {
	
	@RequestMapping(value="/room")
	public String reserve(Model model) throws Exception {
		return ".room.room";
	}
}
