package com.duospace.duogram.search;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.member.SessionInfo;

@Controller("duogram.totalSearchController")
public class SearchController {
	
	//검색 페이지 로딩
	@RequestMapping(value="/duogram/search", method=RequestMethod.GET)
	public String searchPage(
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpSession session,
			Model model
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		}else {
			state="true";
		}
		//포워딩할 jsp에 넘길 데이터
		model.addAttribute("state", state);
		model.addAttribute("searchValue", searchValue);
		
		return ".duoGram.search.listSearch";
	}
}
