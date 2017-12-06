package com.duospace.admin.spot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.spot.SpotController")
public class SpotController {
	
	@RequestMapping(value="/admin/spotlist")
	public String list(Model model) throws Exception {

		return ".admin4.menu3.spot.spotlist";
	}
	
	@RequestMapping(value="/admin/spot/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		
		return".admin4.menu3.spot.created";
	}
	
	
}
