package com.duospace.admin.seat;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
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
		
		String query="page="+current_page;
		
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
	public Map<String, Object> listFloor(int spotCode) throws Exception{
		Map<String, Object> model = new HashMap<>();
		
		//서비스에서 층리스트 가져오기
		
		List<Seat> fList = service.listFloor(spotCode);
		
		model.put("fList", fList);
		
		
		return model;
	}
	
	
	//배치도 만들기 양식
	@RequestMapping(value="/admin/seat/created", method=RequestMethod.GET)
	public String createdSeats(Model model) throws Exception{

		List<Seat> spotList=service.listSpot();
	
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
		
		List<String> seatList = Arrays.asList(seatNums);
		
		String li = seatList.toString();
		//System.out.println(li);   //[1-4, 2-4, 3-4] 로 배치도에 저장됨.
		
		Map<String, Object> map = new HashMap<>();
		
		String seat_Html=myUtil.htmlToStr(seatHtml);
		//System.out.println(seat_Html);
		
		map.put("placeMent", seat_Html);
		map.put("floorNum", floorNum);
		
		service.insertPlacement(map);
		
		return "redirect:/admin/seat/list";
	}
	
	
	
	
}











