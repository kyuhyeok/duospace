package com.duospace.duospace.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("duospace.MyPageController")
public class MyPageController {
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() {
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
