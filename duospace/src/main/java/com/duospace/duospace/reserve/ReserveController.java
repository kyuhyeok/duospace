package com.duospace.duospace.reserve;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.common.DuospaceUtil;

@Controller("duospace.reserveController")
public class ReserveController {

	@Autowired
	ReserveService service;
	
	@Autowired
	DuospaceUtil myUtil;
	
	@RequestMapping(value="/reserve")
	public String reserve_remove(
			@RequestParam(value="spotCode", defaultValue="42") int spotCode,
			Model model) throws Exception {
		
		List<Reserve> floorList = service.floorList(spotCode);
		
		
		String floorMaching = "(^[0-9].*)";
		Pattern pattern = Pattern.compile(floorMaching);
		for(Reserve dto : floorList) {
			Matcher match=pattern.matcher(dto.getFloorName());
			if(! match.find()) {
				floorList.remove(dto);
			}
		}
		
		model.addAttribute("floorList", floorList);
		
		return ".reserve.reserve-seat";
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
		
		//선택한 층의 배치도
		Reserve dto = service.readPlacement(floorNum);
		if(dto!=null)
			dto.setPlacement(myUtil.htmlToStr(dto.getPlacement()));
		
		//model.addAttribute("dto", dto);
		
		model.addAttribute("passList", passList);
		model.addAttribute("floorList", floorList);
		
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

		Reserve dto =service.readPlacement(floorNum);  //배치도
		
		if(dto!=null)
			dto.setPlacement(myUtil.htmlToStr(dto.getPlacement()));
		
		
		model.addAttribute("rList", list);
		model.addAttribute("dto", dto);
		
		
		return "duospace/reserve/placeMent";
	}
}
