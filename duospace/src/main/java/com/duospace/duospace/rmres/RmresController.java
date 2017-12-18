package com.duospace.duospace.rmres;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.member.SessionInfo;

@Controller("duospace.room.RmresController")
public class RmresController {
	
	@Autowired
	private RmresService service;
	
	
	@RequestMapping(value="/createdForm")
	public String list(Model model) throws Exception{
		List<Rmres> rmlist=service.listRmres();
		
		model.addAttribute("rmlist", rmlist);
		return "/duospace/room/createdForm";
	}
	
	@RequestMapping(value="/rmres")
	public String insertRmres(
			Rmres dto,
			HttpSession session,
			Model model
			) {
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("user");
			dto.setMemberNum(info.getMemberNum());
			service.insertRmres(dto);
			
		} catch (Exception e) {
			e.toString();
		}
		
		return ".room.room";
	}
}
