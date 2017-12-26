package com.duospace.duospace.epilogue;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.common.DuospaceUtil;
import com.duospace.member.SessionInfo;

@Controller("duospace.epilogueController")
public class epilogueController {
	
	@Autowired
	private epilogueService service;
	
	@Autowired
	private DuospaceUtil myUtil;
	
	@RequestMapping(value="/epilogue")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="rows", defaultValue="10")int rows,
			Model model) throws Exception {
		Map<String, Object> map= new HashMap<>();
		
		
		int dataCount=service.dataCount();
		
		int total_page=myUtil.pageCount(current_page, dataCount);
		
		if(total_page>current_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<epilogue> list=service.listReview(map);
		
		model.addAttribute("list", list);
		
		
		return ".epilogue.list";
	}
	
	@RequestMapping(value="/duospace/epilogue/created", method=RequestMethod.GET)
	public String createdForm(
			@RequestParam int reservNum,
			@RequestParam String spotName,
			Model model) throws Exception{
		model.addAttribute("reservNum", reservNum);
		model.addAttribute("spotName", spotName);
		model.addAttribute("mode", "created");
		
		return ".userSpace.epilogue.e_created";
	}
	
	@RequestMapping(value="/duospace/epilogue/created", method=RequestMethod.POST)
	public String createdSubmit(
			epilogue dto,
			@RequestParam int reservNum,
			Model model,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"bbs";
		
		dto.setMemberNum(info.getMemberNum());
		dto.setReservNum(reservNum);
		
		service.insertReview(dto, pathname);
		
		return "redirect:/mypage";
	}
	
	
}
