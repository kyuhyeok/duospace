package com.duospace.duospace.reserve;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.common.DuospaceUtil;
import com.duospace.duospace.rmres.Rmres;
import com.duospace.member.SessionInfo;

@Controller("duospace.reserveController")
public class ReserveController {

	@Autowired
	ReserveService service;
	
	@Autowired
	DuospaceUtil myUtil;
	
	
	@RequestMapping(value="/seat/updateForm")
	public String list(String price,Model model) throws Exception{
	
		//model.addAttribute("rmlist", rmlist);
		return "/duospace/reserve/updateForm";
	}
	
	
	@RequestMapping(value="/duospace/reserve")
	public String reserve(
			@RequestParam(value="spotCode", defaultValue="3") int spotCode,
			@RequestParam(value="floorNum", defaultValue="1") int floorNum,
			Model model) throws Exception {
		
		//이용권리스트
		List<Reserve> passList = service.passList();  
		/*
		 	1111-11-11 08:00
			1111-11-12 00:00
			1111-12-11 00:00
		 */
		
		//지역리스트
		List<Reserve> regionList = service.regionList();
		
		//총지점리스트
		List<Reserve> spotList = service.spotList();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		Date st =format.parse("1111-11-11 00:00");
		Calendar sCal = Calendar.getInstance();
		Calendar dCal = Calendar.getInstance();
		long gap;
		for(Reserve dto: passList) {
			//System.out.println(dto.getPassName());
			Date d=format.parse(dto.getPassDate());
			sCal.setTime(st);
			dCal.setTime(d);
			gap=dCal.getTimeInMillis()-sCal.getTimeInMillis();
			dto.setPassHour(gap/(60*60*1000));
		}
		
		
		//선택한 지점의 층리스트
		List<Reserve> floorList = service.floorList(spotCode);
		
		String spotName="";
		if(floorList!=null)
			 spotName=floorList.get(0).getSpotName();
		
		//층 이름이 숫자로 시작하는 경우에만 list에 넣음
		String floorMaching = "(^[0-9].*)";
		Pattern pattern = Pattern.compile(floorMaching);
		for(int i=0; i<floorList.size();i++) {
			Matcher match=pattern.matcher(floorList.get(i).getFloorName());
			if(! match.find()) {
				floorList.remove(i);
				i--;
			}
		}
		
	/*	//선택한 층의 배치도
		Reserve dto = service.readPlacement(floorNum);
		if(dto!=null)
			dto.setPlacement(myUtil.htmlToStr(dto.getPlacement()));
	*/	
		//model.addAttribute("dto", dto);
		
		model.addAttribute("spotName", spotName);
		model.addAttribute("passList", passList);
		model.addAttribute("floorList", floorList);
		model.addAttribute("regionList", regionList);
		model.addAttribute("spotList", spotList);
		
		return ".reserve.reserve-seat";
	}
	
	/*text방식*/
	@RequestMapping(value="/duospace/readPlacement",method=RequestMethod.POST)
	public String readPlacement(
			@RequestParam String startTime
			,@RequestParam String endTime
			,@RequestParam int floorNum
			,Model model
			)throws Exception{
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("floorNum", floorNum);
		
		List<Reserve> list = service.reserveList(map);   // 해당 시간의 배치도의 예약좌석내역(list에 들어있는 좌석 x표시해야함)
		
		/*나중에 지울것*/
		if(list==null)
			System.out.println("list 는 null");
		else
			System.out.println("list size="+list.size());
		
		
		
		Reserve dto =service.readPlacement(floorNum);  //배치도
		
		if(dto!=null)
			dto.setPlacement(myUtil.htmlToStr(dto.getPlacement()));
		

		model.addAttribute("reserveList", list);
		model.addAttribute("dto", dto);
		
		
		return "duospace/reserve/placeMent";
	}
	
	@RequestMapping(value="/duospace/reserve_com", method=RequestMethod.POST)
	public String reserveSubmit(
			@RequestParam int passCode,
			@RequestParam String seatName,
			@RequestParam String startTime[],
			@RequestParam String startDate,
			@RequestParam String endTime,
			@RequestParam int reserve_floor,
			HttpSession session,
			Model model
			) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		if(info==null)
			return "redirect:/duospace/reserve";
		
		Map<String, Object> map = new HashMap<>();
		
		Reserve dto = service.readPlacement(reserve_floor);
		
		if(dto==null)
			return "redirect:/duospace/reserve";
		
		map.put("placeCode",dto.getPlaceCode());
		map.put("seatName", seatName);
		
		map.put("memberNum", info.getMemberNum());
		
		int seatCode=service.readSeatCode(map);
		//System.out.println(seatCode);
		
		
	
		map.put("passCode", passCode);  //이용권코드
		map.put("seatCode", seatCode); //좌석코드
		map.put("endDate", endTime);  //종료일
		map.put("startDate",startDate);// 시작일
		
		try {
			service.insertReserve(map);
			
		} catch (Exception e) {
			//인서트 안된경우
			System.out.println("");
		}
		
		int reserveNum=service.readReserveNum();

		
		
		dto.setPassCode(passCode);
		dto.setReservNum(reserveNum);
		dto.setStartDate(startDate);
		dto.setEndDate(endTime);
		dto.setFloorNum(reserve_floor);
		dto.setSeatName(seatName);
		
		model.addAttribute("dto", dto);
		
		
		return ".complete.scomplete";
	}
	
	
}











