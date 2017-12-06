package com.duospace.admin.spot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.spot.SpotController")
public class SpotController {
	@Autowired
	private SpotService service;
	
	@RequestMapping(value="/admin/spotlist")
	public String list(Model model) throws Exception {

		return ".admin4.menu3.spot.spotlist";
	}
	
	@RequestMapping(value="/admin/spot/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		
		return".admin4.menu3.spot.created";
	}
	
	@RequestMapping(value="/admin/spot/created", method=RequestMethod.POST)
	public String createdSubmit(
			Spot dto
			) throws Exception{
		
		service.insertSpot(dto);
		
		return "redirect:/admin/spotlist";
	}
}
