package com.duospace.duospace.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.member.SessionInfo;

@Controller("duospace.MyPageController")
public class MyPageController {
	
	@Autowired
	private MypageService service;
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage(
			Model model,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		int memberNum= info.getMemberNum();
		
		List<Mypage> mylist=service.myList(memberNum);
		model.addAttribute("mylist", mylist);
		
		return ".userSpace.mypage.main";
	}
	
	@RequestMapping(value="/privacy", method=RequestMethod.GET)
	public String privacy() {
		return ".userSpace.mypage.privacy.list";
	}
	
	@RequestMapping(value="/agreement", method=RequestMethod.GET)
	public String agreement() {
		return ".userSpace.mypage.agreement.list";
	}
	
	@RequestMapping(value="/myinfo", method=RequestMethod.GET)
	public String myinfo() {
		return ".userSpace.mypage.myinfo.info";
	}
	
	@RequestMapping(value="/paylist", method=RequestMethod.GET)
	public String paylist() {
		return ".userSpace.mypage.pay.list";
	}
	
	@RequestMapping(value="/qnalist", method=RequestMethod.GET)
	public String qnalist() {
		return ".userSpace.mypage.qna.list";
	}
}
