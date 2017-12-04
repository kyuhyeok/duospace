package com.duospace.duospace.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("duospace.ReviewController")
public class ReviewController {
	
	@RequestMapping(value="/review")
	public String reserve(Model model) throws Exception {
		return ".review.review";
	}	
}
