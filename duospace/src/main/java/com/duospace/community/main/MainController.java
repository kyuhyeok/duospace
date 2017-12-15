package com.duospace.community.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.duospace.community.commaincate.Commaincate;
import com.duospace.community.commaincate.CommaincateService;

@Controller("community.mainController")
public class MainController {
	@Autowired
	private CommaincateService service;
	
	@RequestMapping(value="/community",method=RequestMethod.GET)
	public String main(
			Model model
			)throws Exception{
		//데이터 개수
		
		
		Map<String, Object> map = new HashMap<>();
		
		List<Commaincate> cateList = service.listCommaincate(map);
		
		List<List<Commaincate>> boardList=new ArrayList<>();
		for(Commaincate c : cateList) {
			map.put("cateNum", c.getCateNum());
			boardList.add(service.listCommainboard(map));
		}
		
		model.addAttribute("boardList",boardList);
		return ".communityLayout";
	}
	
}
