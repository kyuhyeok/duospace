package com.duospace.community.moim;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.member.SessionInfo;

@Controller("meeting.moimController")
public class MoimController {
	@Autowired
	private MoimService service;
	//방안에 쿼리 다여기서..
	
	//모임 가입처리
	@RequestMapping(value="/community/moimRegister",method=RequestMethod.POST)
	public String moimRegister(
			@RequestParam int cmoimCode,
			HttpSession session,
			Model model
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		Map<String, Object> map = new HashMap<>();
		map.put("memberNum", info.getMemberNum());
		map.put("cmoimCode", cmoimCode);
		service.insertAccept(map);//로그인된상태에서 번호가져옴
		
		
		
		return "redirect:/community/moim"+cmoimCode;//redirect에 이렇게도 사용가능(로그인된 넘버가져오기)
	}
	
	//모임 메인화면
	@RequestMapping(value="/community/moim{cmoimCode}",method=RequestMethod.GET)
	public String commoim (
			@PathVariable int cmoimCode,
			HttpSession session,
			Model model
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		Map<String, Object> map = new HashMap<>();
		map.put("memberNum", info.getMemberNum());
		map.put("cmoimCode", cmoimCode);
	
		int countAccept=service.countAccept(map);
		
		if(countAccept==0) {
			return ".community.moim.acceptcheck";
		}
		
		model.addAttribute("cmoimCode",cmoimCode);
		
		return ".community.moim.moim";
	}
	
	
	
	
	
}
