package com.duospace.admin.room;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.room.RoomController")
public class RoomController {
	
	@RequestMapping(value="/admin/room/created", method=RequestMethod.GET)
	public String CreatedForm(Model model) {
		
		model.addAttribute("mode", "created");
		
		return ".admin4.menu3.room.created";
	}
}
