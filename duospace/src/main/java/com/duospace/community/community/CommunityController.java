package com.duospace.community.community;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.common.MyUtil;
import com.duospace.community.commaincate.Commaincate;
import com.duospace.member.SessionInfo;

@Controller("community.communityController")
public class CommunityController {
	@Autowired
	private CommunityService service;
	@Autowired
	private MyUtil myUtil;
	
	
	@RequestMapping(value="/community/list" , method=RequestMethod.GET)
	public String list(
			@RequestParam int cateNum,
			@RequestParam(value="page",defaultValue="1") int current_page,
			@RequestParam(value="searchKey",defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue",defaultValue="") String searchValue,
			HttpServletRequest req,
			Commaincate dto,
			Model model
			)throws Exception {
		
		int rows=5;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {//GET방식인 경우
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		//전체 페이지 수
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if(dataCount !=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		//다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if(total_page < current_page)
			current_page=total_page;
		
		//리스트에 출력할 데이터 가져오기
		int start = (current_page -1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		map.put("cateNum", cateNum);
		//글 리스트
		List<Community> list = service.listCommunity(map);

		
		model.addAttribute("cateNum",cateNum);
		model.addAttribute("list",list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
		
		return ".community.community.list";
	}
	
	//글쓰기 폼
	@RequestMapping(value="/community/created",method=RequestMethod.GET)
	public String createdForm(
			@RequestParam int cateNum,
			HttpSession session,
			Model model
			)throws Exception {
		
		
		model.addAttribute("mode","created");
		model.addAttribute("cateNum",cateNum);
		
		return ".community.community.created";
	}
	
	//글쓰기 실행
	@RequestMapping(value="/community/created" ,method=RequestMethod.POST)
	public String createdSubmit(
			@RequestParam int cateNum,
			Community dto,
			HttpSession session,
			Model model
			)throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		service.insertCommunity(dto);
		
		int memberNum = info.getMemberNum();
		
		model.addAttribute("memberNum",memberNum);
		model.addAttribute("cateNum",cateNum);
		
		return "redirect:/community/list";
	}
	
	@RequestMapping(value="/community/article",method=RequestMethod.GET)
	public String articleForm() {
		
		return ".community.community.article";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
