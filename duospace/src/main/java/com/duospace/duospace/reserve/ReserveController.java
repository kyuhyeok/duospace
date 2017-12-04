package com.duospace.duospace.reserve;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("duospace.reserveController")
public class ReserveController {

	@RequestMapping(value="/reserve")
	public String reserve(Model model) throws Exception {
		return ".reserve.reserve-seat";
	}
}
