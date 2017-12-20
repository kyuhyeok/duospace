package com.duospace.admin.reserve;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("admin.reserveController")
public class ReserveController {
	
	@Autowired
	private ReserveService service;

	@RequestMapping(value="/admin/reserve/list")
	public String reserveList(
			@RequestParam(value="where", defaultValue="0") int where,
			@RequestParam(value="startDate", defaultValue="") String startDate,
			@RequestParam(value="endDate", defaultValue="") String endDate,
			@RequestParam(value="searchKey", defaultValue="spotName")String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req
			) throws Exception{
		
		//where 0이면 room 1이면 seat예약
		
		int rows=10;
		int dataCount=0;
		int total_page=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue,"utf-8");
		}
		
		
		//전체페이지수
		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		
		dataCount=service.dataCount(map);
		System.out.println(dataCount);
		
		
		return ".admin4.menu3.reserve.reservelist";
	}
	
	
}








