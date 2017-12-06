package com.duospace.community.commoim;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duospace.member.SessionInfo;

@Controller("community.commoimController")
public class CommoimController {
	@Autowired
	private CommoimService service;
	
	
	@RequestMapping(value="/community/commoim/commoim",method=RequestMethod.GET)
	public String list() {
		
		return ".community.commoim.commoim";
	}
	
	@RequestMapping(value="/commoim/insert",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Commoim dto,
			HttpSession session
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		if(info==null) {
			state="loginFail";
		}else {
			//글을 쓴 사람(로그인한 아이디)
			dto.setMemberNum(info.getMemberNum());
			service.insertCommoim(dto);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
}
