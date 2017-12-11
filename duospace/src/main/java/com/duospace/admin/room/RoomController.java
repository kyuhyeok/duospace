package com.duospace.admin.room;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.common.DuospaceUtil;
import com.duospace.common.FileManager;


@Controller("admin.room.RoomController")
public class RoomController {
	@Autowired
	private RoomService service;

	@Autowired
	private DuospaceUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/admin/room/created", method=RequestMethod.GET)
	public String CreatedForm(Model model) throws Exception{
		
		model.addAttribute("mode", "created");
		
		return ".admin4.menu3.room.created";
	}
	
	@RequestMapping(value="/admin/room/created", method=RequestMethod.POST)
	public String CreatedSubmit(
			Room dto,
			HttpSession session
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+File.separator+"resource"+File.separator+"images"+File.separator+"duospace"+File.separator+"Room";
		
		service.insertRoom(dto, pathname);
		
		
		return "redirect:/admin/room/list";
	}
	
}
