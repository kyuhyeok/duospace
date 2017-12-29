package com.duospace.community.commoim;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duospace.member.SessionInfo;

@Controller("community.commoimController")
public class CommoimController {
	@Autowired
	private CommoimService service;
	
	
	@RequestMapping(value="/community/commoim",method=RequestMethod.GET)
	public String commoimForm(
			Model model
			) {
		
		List<Commoim> comregionlist = service.comregionlist();
		List<Commoim> comcategorylist = service.comcategorylist();
		
		model.addAttribute("comregionlist",comregionlist);
		model.addAttribute("comcategorylist",comcategorylist);
		
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
			
			int cmoimCode = service.cmoimSeq();
			dto.setCmoimCode(cmoimCode);
			service.insertCommoim(dto);
			
			
			Map<String, Object> map = new HashMap<>();
			map.put("memberNum", info.getMemberNum());//방생성후 가입하기.
			map.put("cmoimCode",cmoimCode);
			service.insertAccept(map);//로그인된상태에서 번호가져옴
			
			state="true";
		}
		Map<String, Object> model=new HashMap<>();
		
		model.put("state", state);
		return model;
	}
	
}
