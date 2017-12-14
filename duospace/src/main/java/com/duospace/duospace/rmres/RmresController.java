package com.duospace.duospace.rmres;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("duospace.room.RmresController")
public class RmresController {
	
	@Autowired
	private RmresService service;
	
	@RequestMapping(value="/rmres")
	public String insertRmres(
			Rmres dto,
			HttpSession session
			) throws Exception{
		
		service.insertRmres(dto);
		
		return ".room.room";
	}
}
