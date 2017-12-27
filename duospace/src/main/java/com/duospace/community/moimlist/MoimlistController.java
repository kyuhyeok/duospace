package com.duospace.community.moimlist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.community.commoim.Commoim;
import com.duospace.community.commoim.CommoimService;

@Controller("moimlist.moimlistController")
public class MoimlistController {
	@Autowired
	private CommoimService service;
	
	@RequestMapping(value="/moimlist",method=RequestMethod.GET)
	public String mylist(
			HttpServletRequest req,
			HttpSession session,
			Commoim dto,
			Model model
			)throws Exception{
		
		//데이터 개수
		int dataCount;
		
		Map<String, Object> map = new HashMap<>();
		dataCount=service.dataCountAll();
		
		List<Commoim> list=service.list(map);
		
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("list",list);
		
		return ".community.moim.moimlist";
	}	

	
	
	
}
