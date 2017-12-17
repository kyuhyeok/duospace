package com.duospace.community.moim;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			HttpSession session,
			Model model
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		service.insertAccept(info.getMemberNum());//로그인된상태에서 번호가져옴
		return "redirect:/community/"+info.getMemberNum();//redirect에 이렇게도 사용가능(로그인된 넘버가져오기)
	}
	
	//모임 메인화면
	@RequestMapping(value="/community/moim{cmoimCode}",method=RequestMethod.GET)
	public String commoim (
			@RequestParam int cmoimCode,
			@RequestParam int memberNum,
			HttpSession session,
			Model model
			)throws Exception{
		
		int countAccept=service.countAccept(cmoimCode);
		
		if(countAccept==0) {
			return ".community.moim.acceptcheck";
		}
		
		model.addAttribute("cmoimCode",cmoimCode);
		model.addAttribute("memberNum",memberNum);
		
		return ".community.moim.moim";
	}
	
	
	
	
	
}
