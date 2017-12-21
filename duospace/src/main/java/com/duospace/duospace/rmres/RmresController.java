package com.duospace.duospace.rmres;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duospace.member.SessionInfo;

@Controller("duospace.room.RmresController")
public class RmresController {
	
	@Autowired
	private RmresService service;
	
	
	@RequestMapping(value="/createdForm")
	public String list(	Model model) throws Exception{
		List<Rmres> rmlist=service.listRmres();
	
		
		model.addAttribute("rmlist", rmlist);
		return "/duospace/room/createdForm";
	}
	
	@RequestMapping(value="/rmres")
	public String insertRmres(
			Rmres dto,
			HttpSession session
			) {
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("user");
			dto.setMemberNum(info.getMemberNum());
			service.insertRmres(dto);
			
		} catch (Exception e) {
			e.toString();
		}
		
		return "redirect:/complete";
	}
	
	@RequestMapping(value="/complete")
	public String colist(
			Model model) {
		int reservNum=service.readReserveNum();
		Rmres dto =service.listComplete(reservNum);
		dto.setReservNum(reservNum);
				
		model.addAttribute("dto", dto);
		
		return ".complete.rcomplete";
	}
	
	@RequestMapping(value="/reservCount", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> readCount(
			@RequestParam int roomCode,
			@RequestParam String startDate,
			@RequestParam String endDate
			) { 
		Map<String,Object> map=new HashMap<>();
		
		map.put("roomCode", roomCode);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		int reservCount=service.reservCount(map);

		map.put("reservCount", reservCount);
		
		return map;
				
	}
}
