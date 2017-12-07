package com.duospace.community.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.community.commoim.Commoim;
import com.duospace.community.commoim.CommoimService;
import com.duospace.member.SessionInfo;

@Controller("community.mainController")
public class MainController {
	@Autowired
	private CommoimService service;
	
	@RequestMapping(value="/community/{memberNum}",method=RequestMethod.GET)
	public String list(
			@PathVariable int memberNum,
			HttpServletRequest req,
			HttpSession session,
			Commoim dto,
			Model model
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String me="true";
		if(info.getMemberNum()!=memberNum)
			me="false";
		model.addAttribute("me", me);
		
		//데이터 개수
		int dataCount;
		Map<String, Object> map = new HashMap<>();
		map.put("memberNum", memberNum);
		dataCount=dto.getMoimcount();
		
		List<Commoim> list=service.listCommoim(map);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("memberNum",memberNum);
		model.addAttribute("list",list);
		
		return ".communityLayout";
	}	
}
