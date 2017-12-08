package com.duospace.admin.floor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("admin.floor.FloorController")
public class FloorController {
	
	@Autowired
	private FloorService service;
	
	
	@RequestMapping(value="/admin/floor/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws  Exception{
		
		List<Floor> list=service.listSpot();
		
		model.addAttribute("list", list);
		model.addAttribute("mode", "created");
		
		return ".admin4.menu3.floor.created";
	}
	@RequestMapping(value="/admin/floor/created", method=RequestMethod.POST)
	public String createdSubmit(
			Floor dto
			) throws Exception{
		
		service.insertFloor(dto);
		
		return "redirect:/admin/spotlist";
	}
	
}
