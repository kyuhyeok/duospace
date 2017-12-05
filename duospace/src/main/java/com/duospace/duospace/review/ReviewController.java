package com.duospace.duospace.review;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.member.SessionInfo;

@Controller("duospace.ReviewController")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@RequestMapping(value="/review")
	public String reserve(Model model) throws Exception {
		return ".review.review";
	}
	
	@RequestMapping(value="/duospace/review/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		
		model.addAttribute("mode", "created");
		
		return ".review.r_created";
	}
	
	@RequestMapping(value="/duospace/review/created", method=RequestMethod.POST)
	public String createdSubmit(
			Review dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"bbs";
		
		dto.setUserId(info.getUserId());

		service.insertReview(dto, pathname);
		
		return "redirect:/review";
		
	}
}
