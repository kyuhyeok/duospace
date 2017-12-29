package com.duospace.community.commaincate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller("comadmin.adminController")
public class CommaincateController {
	@Autowired
	private CommaincateService service;
	
	
	@RequestMapping(value="/commaincate/admin", method=RequestMethod.GET)	
	public String adminForm(
			
			)throws Exception{
		
		
		
		return ".community.admin.admin";
	}
	
		
	
	@RequestMapping(value="/community/commaincate")
	public String commaincateForm(
			Model model
			) {
		Map<String, Object> map = new HashMap<>();
		List<Commaincate> list = service.listCommaincate(map);
		
		model.addAttribute("list",list);
		
		return ".community.admin.commaincate";
	}
	
	@RequestMapping(value="/commaincate/submit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> commaincateSubmit(
			Commaincate dto
			)throws Exception {
		
		service.insertCommaincate(dto);
		Map<String, Object> map = new HashMap<>();
		dto=service.readCommaincate();
		
		map.put("cateNum", dto.getCateNum());
		map.put("boardName", dto.getBoardName());
		
		return map;
	}
	
	@RequestMapping(value="/commaincate/updatecate")
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Commaincate dto,
			Model model
			)throws Exception {
		Map<String, Object> map = new HashMap<>();
		service.updateCommaincate(dto);
		
		return map;
	}
	
	
	@RequestMapping(value="/commaincate/deletecate",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteCommaincate(
			@RequestParam int cateNum
			) {
		Map<String, Object> map = new HashMap<>();
		int result=service.deleteCommaincate(cateNum);
		map.put("result", result);
		
		return map;
	}
	
}
