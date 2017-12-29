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
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		
		List<Reserve> list = service.spotList();
		
		model.addAttribute("where", 1);
		model.addAttribute("spotList", list);
		
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
		
		List<Reserve> list = service.checkInList();
		
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		
		return "/admin/menu3/reserve/placeMent";
	}
	
	@RequestMapping(value="/admin/reserve/seatReserveList_all", method=RequestMethod.POST)
	public String seatReserveList_all(
			@RequestParam int placeCode,
			@RequestParam(value="page", defaultValue="1")int current_page,
			Model model,
			HttpServletRequest req
			)throws Exception{
		
		String cp=req.getContextPath();
		
		Map<String, Object> map  = new HashMap<>();
		map.put("placeCode", placeCode);
		
		int rows=5;
		int dataCount=service.dataCountComSeat_all(map);
		int total_page=myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page)
			current_page=total_page;
		
		
		String listUrl=cp+"/admin/reserve/seatReserveList";
		String paging=myUtil.paging2Method(current_page, total_page, listUrl);
		
		
		List<Reserve> list = service.seatReserveList_all(map);
		
		System.out.println(list.size()+"좌석 선택후 예약 리스트------");
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		
		
		
		return "/admin/menu3/reserve/seatList";
	}
	
	
	
	@RequestMapping(value="/admin/reserve/seatReserveList", method=RequestMethod.POST)
	public String seatReserveList(
			@RequestParam int placeCode,
			@RequestParam String seatName,
			@RequestParam(value="page", defaultValue="1")int current_page,
			Model model,
			HttpServletRequest req
			)throws Exception{
		
		String cp=req.getContextPath();
		
		System.out.println(seatName+"좌석이름으으으으");
		
		Map<String, Object> map  = new HashMap<>();
		map.put("placeCode", placeCode);
		map.put("seatName", seatName);
		
		int rows=5;
		int dataCount=service.dataCountComSeat(map);
		int total_page=myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page)
			current_page=total_page;
		
		
		String listUrl=cp+"/admin/reserve/seatReserveList";
		String paging=myUtil.paging2Method(current_page, total_page, listUrl);
		
		
		List<Reserve> list = service.seatReserveList(map);
		
		System.out.println(list.size()+"좌석 선택후 예약 리스트------");
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		
		
		
		return "/admin/menu3/reserve/seatList";
	}

	@RequestMapping(value="/admin/reserve/floor/list", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> floorList(int spotCode) throws Exception{
		Map<String, Object> model = new HashMap<>();
		List<Reserve> flist= service.floorList(spotCode);
		//System.out.println(flist.size());
		model.put("fList", flist);
		
		
		return model;
	}
	
	
	@RequestMapping(value="/admin/reserve/complete/list")
	public String jinanReserveList(@RequestParam(value="page", defaultValue="1") int current_page,
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
		
		if(where==0)
			dataCount=service.jinanRoomdataCount(map);
		else
			dataCount=service.jinanSeatdataCount(map);
			
		
		total_page=myUtil.pageCount(rows, dataCount);//전체페이지수
		
		if(current_page>total_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		
		List<Reserve> list = null;
		if(where==0)		
			list=service.jinanRoomReserveList(map);
		else
			list=service.jinanSeatReserveList(map);
	
			
		
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
		
		String listUrl=cp+"/admin/reserve/complete/list?"+query;
		String paging=myUtil.paging2Method(current_page, total_page, listUrl);
		
		query+="&page="+current_page;
		
		model.addAttribute("where", where);
		model.addAttribute("paging", paging);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		
		return ".admin4.menu3.reserve.reservelist-jinan";
	}
	
	

}








