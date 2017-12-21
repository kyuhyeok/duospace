package com.duospace.admin.reserve;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.common.DuospaceUtil;

@Controller("admin.reserveController")
public class ReserveController {
	
	@Autowired
	private ReserveService service;
	
	@Autowired
	private DuospaceUtil myUtil;
	

	@RequestMapping(value="/admin/reserve/list")
	public String reserveList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="where", defaultValue="0") int where,
			@RequestParam(value="startDate", defaultValue="") String startDate,
			@RequestParam(value="endDate", defaultValue="") String endDate,
			@RequestParam(value="searchKey", defaultValue="spotName")String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req
			) throws Exception{
		
		//where 0이면 room 1이면 seat예약
		
		String cp=req.getContextPath();
		
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
		System.out.println(dataCount);  //데이터갯수 나중에 삭제
		
		total_page=myUtil.pageCount(rows, dataCount);//전체페이지수
		
		if(current_page>total_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		System.out.println("start====="+start);
		System.out.println("end======"+end);
		
		List<Reserve> list = service.reserveList(map);
		
		//글번호
		int listNum, n=0;
		for(Reserve dto : list) {
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String query ="where="+where;
		
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		if(startDate.length()!=0 && endDate.length()!=0) {
			query+="&startDate="+startDate+"&endDate="+endDate;
		}else if(endDate.length()!=0) {
			query+="&endDate="+endDate;
		}else if(startDate.length()!=0) {
			query+="&startDate="+startDate;
		}
		
		String listUrl=cp+"/admin/reserve/list?"+query;
		String paging=myUtil.paging2Method(current_page, total_page, listUrl);
		
		query+="&page="+current_page;
		
		model.addAttribute("paging", paging);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		
		return ".admin4.menu3.reserve.reservelist";
	}
	
	@RequestMapping(value="/admin/reserve/delete", method=RequestMethod.GET)
	public String deleteReserve(
			@RequestParam int rmresNum,
			@RequestParam(value="page", defaultValue="1") String page
			) throws Exception{
		
		try {
			service.delete(rmresNum);
		} catch (Exception e) {
		}
		
		
		return "redirect:/admin/reserve/list?page="+page;
	}
	
	
	@RequestMapping("/admin/reserve/seatList")
	public String seatReserveList(Model model)throws Exception{
		
		model.addAttribute("where", 1);
		
		return ".admin4.menu3.reserve.seat_reservelist";
	}
	
	@RequestMapping(value="/admin/reserve/readPlacement")
	public String readReserve(
			@RequestParam int floorNum,
			Model model
			) throws Exception{
		
		//배치도와 체크인 현황 
		Reserve dto = service.readPlacement(floorNum);
		
		if(dto==null) {
			System.out.println(floorNum+"ss");
			System.out.println("dto는 널이란다~~~~");
		}
		
		if(dto!=null)
			dto.setPlacement(myUtil.htmlToStr(dto.getPlacement()));
		
		model.addAttribute("dto", dto);
		
		
		return "/admin/menu3/reserve/placeMent";
	}
	
	
}








