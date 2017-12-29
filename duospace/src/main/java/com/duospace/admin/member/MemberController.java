package com.duospace.admin.member;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

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

@Controller("admin.member.memberController")
public class MemberController {
	
	@Autowired
	private DuospaceUtil myUtil;
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/admin/member/list")
	public String list(
			@RequestParam(value="rows", defaultValue="10") int rows,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="name")String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp=req.getContextPath();
		
		
		int dataCount=0;
		int total_page=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue,"utf-8");
		}
		
		
		//전체페이지수
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		
		dataCount=service.dataCount(map);
		//System.out.println(dataCount);  //데이터갯수 나중에 삭제
		
		total_page=myUtil.pageCount(rows, dataCount);//전체페이지수
		
		if(current_page>total_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
	
		List<Member> list = service.memberList(map);
		
		//글번호
		int listNum, n=0;
		for(Member dto : list) {
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="rows="+rows;
		
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		
		
		String listUrl=cp+"/admin/member/list?"+query;
		String paging=myUtil.paging2Method(current_page, total_page, listUrl);
	
		query+="&page="+current_page;
		
		model.addAttribute("paging", paging);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		
		
		return ".admin4.menu3.member.memberlist";
	}
	@RequestMapping(value="/admin/member/delete", method=RequestMethod.GET)
	public String deleteMember(
			@RequestParam int memberNum,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="rows", defaultValue="10") int rows,
			@RequestParam(value="searchKey", defaultValue="name")String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) {
		
		service.memberDelete(memberNum);
		String query = "page="+page+"&rows="+rows;
		
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		
		return "redirect:/admin/member/list?"+query;
	}
	
	
}
