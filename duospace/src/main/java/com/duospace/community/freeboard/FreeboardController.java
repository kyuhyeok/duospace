package com.duospace.community.freeboard;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duospace.member.SessionInfo;

@Controller("freeboard.freeboardcontroller")
public class FreeboardController {
	@Autowired
	private FreeboardService service;
	
	@RequestMapping(value="/meeting/freeboard",method=RequestMethod.GET)
	@ResponseBody
	public String list(Model model) {
		
		return ".community.mymeeting.freeboard";
	}
	
	
	
	@RequestMapping(value="/freeboard/insertFreeboard",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFreeboard(
			Freeboard dto,
			HttpSession session
			){
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		if(info==null) {
			state="loginFail";
		}else {
			dto.setWriter(info.getUserId());
			service.insertFreeboard(dto);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	
	

	

	
	
	
	
	
	
	
	
	
	
}
