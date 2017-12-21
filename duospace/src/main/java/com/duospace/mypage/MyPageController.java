package com.duospace.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller(value="duospace.mypage.MyPageController")
public class MyPageController {
	
	@RequestMapping(value="/mypage")
	public String mainlist() {
		return ".userSpace.mypage.main";
	}
	
	@RequestMapping(value="/paylist")
	public String paylist() {
		return ".userSpace.mypage.pay.list";
	}
	
	@RequestMapping(value="/myinfo")
	public String myinfo() {
		return ".userSpace.mypage.myinfo.info";
	}
	
	@RequestMapping(value="/qnalist")
	public String qnalist() {
		return".userSpace.mypage.qna.list";
	}
	
	@RequestMapping(value="/privacy")
	public String privacy() {
		return".userSpace.mypage.privacy.list";
	}
	
	@RequestMapping(value="/agreement")
	public String agreement() {
		return ".userSpace.mypage.agreement.list";
	}
	
	
}
