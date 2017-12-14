package com.duospace.admin.seat;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duospace.common.DuospaceUtil;

@Controller("admin.seatController")
public class SeatController {

	@Autowired
	SeatService service;
	
	@Autowired
	DuospaceUtil myUtil;
	
	@RequestMapping(value="/admin/seat/list", method=RequestMethod.GET)
	public String listSeat(
			@RequestParam(value="searchKey", defaultValue="spotName") String searchKey
			,@RequestParam(value="searchValue", defaultValue="") String searchValue
			,@RequestParam(value="page", defaultValue="1") int current_page
			,@RequestParam(value="rows", defaultValue="10") int rows
			,HttpServletRequest req
			,Model model
			) throws Exception{

		String cp=req.getContextPath();
		
		int dataCount;
		int total_page;
		
		if(req.getMethod().equalsIgnoreCase("GET"))
			searchValue=URLDecoder.decode(searchValue,"utf-8");
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		
		total_page=myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page)
			current_page=total_page;
		
		
		int start=(current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Seat> list = service.listPlacement(map);
		
		//글번호
		int listNum,n=0;
		for(Seat dto:list) {
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="page="+current_page+"&rows="+rows;
		
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		String articleUrl=cp+"/admin/seat/article?"+query;
		String listUrl=cp+"/admin/seat/list?"+query;
		String paging = myUtil.paging2Method(current_page, total_page, listUrl);
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("totalPage", total_page);
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		
		return ".admin4.menu3.seat.list";
	}
	
	
	
	
	//지점선택이후 층리스트 
	@RequestMapping(value="/admin/seat/floorList", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listTotalFloor(int spotCode) throws Exception{
		Map<String, Object> model = new HashMap<>();
		
		//서비스에서 층리스트 가져오기
		
		List<Seat> fList = service.listTotalFloor(spotCode);
		
		model.put("fList", fList);
		
		
		return model;
	}
	
	
	//배치도 만들기 양식
	@RequestMapping(value="/admin/seat/created", method=RequestMethod.GET)
	public String createdSeats(Model model) throws Exception{

		List<Seat> spotList=service.listSpot();
	
		model.addAttribute("mode", "created");
		model.addAttribute("spotList", spotList);
		return ".admin4.menu3.seat.created";
	}
	
	
	//배치도 DB에 저장하기
	@RequestMapping(value="/admin/seat/created", method=RequestMethod.POST)
	public String createdSubmit(
			@RequestParam String[] seatNums,
			@RequestParam String floorNum,
			@RequestParam String seatHtml
			) throws Exception{
		
		
		//배열-> List
		List<String> seatList = Arrays.asList(seatNums);
		
		//String li = seatList.toString();
		//System.out.println(li);   //[1-4, 2-4, 3-4] 로 배치도에 저장됨.
		
		
		List<Seat> sList=new ArrayList<>();

		Map<String, Object> map = new HashMap<>();
		
		String seat_Html=myUtil.strToHtml(seatHtml);
		
		
		map.put("placeMent", seat_Html);
		map.put("floorNum", floorNum);
		
		int result=service.insertPlacement(map);
		
		if(result!=0) {
			int placementCode=service.maxPlacementNum();
			System.out.println("좌석갯수:"+seatList.size());
			for(String name: seatList) {
				System.out.println(name);
				Seat dto = new Seat();
				dto.setPlaceCode(placementCode);
				dto.setSeatName(name);
				sList.add(dto);
			}
		}
		
		service.insertSeats(sList);
		
		
		
		return "redirect:/admin/seat/list";
	}
	
	@RequestMapping(value="/admin/seat/article", method=RequestMethod.GET)
	public String article(
			@RequestParam(value="searchKey", defaultValue="spotName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam String page,
			@RequestParam int spotCode,
			@RequestParam String rows,
			@RequestParam int placeCode,
			Model model
			) throws Exception{
		
		
	
		Seat dto = service.readSpot(spotCode);
		
		String query="&rows="+rows;
		if(searchValue.length()!=0)
			query="&searchKey="+searchKey+"&searchValue="+searchValue;
		
		if(dto==null)
			return "redirect:/admin/seat/list?page="+page+query;
		
		//System.out.println("spotCode:"+spotCode);
		
		
		List<Seat> fList = service.listFloor(spotCode);
		
		/*
		for(Seat d:fList) {
			System.out.println(d.getPlaceCode());
		}
		*/
		
		//dto.setPlaceMent(myUtil.htmlToStr(dto.getPlaceMent()));
		
		model.addAttribute("placeCode", placeCode);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("floorList", fList);  //지점의 층 리스트
		
		
		
		return ".admin4.menu3.seat.article";
	}
	
	
	@RequestMapping(value="/admin/seat/readPlacement", method=RequestMethod.POST)
	public String placementShow(@RequestParam int placeCode,Model model)throws Exception{
		
		Seat dto = service.readPlacement(placeCode);
		
		
		
		if(dto!=null)
			dto.setPlaceMent(myUtil.htmlToStr(dto.getPlaceMent()));
		
		//System.out.println(dto.getPlaceMent());
		
		model.addAttribute("dto", dto);

		return "admin/menu3/seat/placeMent";
	}
	
	@RequestMapping(value="/admin/seat/update", method=RequestMethod.GET)
	public String updatePlacement(
			@RequestParam int placeCode,
			@RequestParam int spotCode,
			Model model
			) throws Exception{
		
		
		Seat s = service.readSpot(spotCode);
		Seat dto = service.readPlacement(placeCode);
		
		if(dto!=null) {
			dto.setPlaceMent(myUtil.htmlToStr(dto.getPlaceMent()));
			dto.setSpotName(s.getSpotName());
			dto.setSpotCode(s.getSpotCode());
		}
		
		List<Seat> list= service.seatList(placeCode);
		
		model.addAttribute("dto", dto);
		model.addAttribute("seatList", list);
		model.addAttribute("mode", "update");
		
		return ".admin4.menu3.seat.update";
	}
	
	@RequestMapping(value="/admin/seat/update", method=RequestMethod.POST)
	public String updateSubmit(
			@RequestParam String[] seatNums,
			@RequestParam String floorNum,
			@RequestParam int placeCode,
			@RequestParam String seatHtml
			)throws Exception{

		//배열-> List
		List<String> seatList = Arrays.asList(seatNums);
		
		//String li = seatList.toString();
		//System.out.println(li);   //[1-4, 2-4, 3-4] 로 배치도에 저장됨.
		
		
		List<Seat> sList=new ArrayList<>();

		for(String name: seatList) {
			System.out.println(name);
			Seat dto = new Seat();
			dto.setSeatName(name);
			sList.add(dto);
		}
		
		Map<String, Object> map = new HashMap<>();
		
		String seat_Html=myUtil.strToHtml(seatHtml);
		
		map.put("placeCode", placeCode);
		map.put("placeMent", seat_Html);
		map.put("floorNum", floorNum);
		map.put("sList", sList);//좌석name만 있음
		
		service.updatePlacement(map);

		return "redirect:/admin/seat/list";
	
	}
	
	
	@RequestMapping(value="/admin/seat/delete", method=RequestMethod.GET)
	public String deletePlacement(@RequestParam int placeCode, Model model)throws Exception{
		
		service.deletePlacement(placeCode);
		
		return "redirect:/admin/seat/list";
	}
	
}











