package com.duospace.duogram.mypage;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duospace.common.MyUtil;
import com.duospace.member.SessionInfo;

@Controller("duogram.mypageController")
public class MypageController {
	
	@Autowired
	private MypageService service;
	
	@Autowired
	private MyUtil util;
	
	// mypage 메인 화면
	@RequestMapping(value="/duogram/mypage/{blogNum}")
	public String duogram(
			@PathVariable int blogNum,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int cnt = service.countAccept(info.getMemberNum());
		if(cnt==0) {
			return "redirect:/duogram/"+blogNum;
		}
		
		String me="true";
		if(info.getMemberNum()!=blogNum)
			me="false";
		
		// sns 타임라인 불러오기
		model.addAttribute("me", me);
		model.addAttribute("blogNum", blogNum);
		
		return ".duoGram.main.mypage";
	}
	
	// 글쓰기
	@RequestMapping(value="/duogram/mypage/insert", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertBorad(
			Mypage dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("user");

		String state;
		if(info==null) {
			state="loginFail";
		} else {
			dto.setMemberNum(info.getMemberNum());
			service.insertBoard(dto);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;	
	}
	
	// 리스트
	@RequestMapping(value="/duogram/mypage/list")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam int blogNum
			) throws Exception {
		
		int rows=10;
		int dataCount;
		int total_page;
		
		Map<String, Object> map=new HashMap<>();
		map.put("blogNum", blogNum);
		
		dataCount=service.dataCount(map);
		total_page = util.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		int listNum, n=0;
		List<Mypage> list=service.listDuogram(map);
		Iterator<Mypage> it=list.iterator();
		while (it.hasNext()) {
			Mypage dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		Map<String, Object> model=new HashMap<>();
		
		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		
		return model;
	}
}
