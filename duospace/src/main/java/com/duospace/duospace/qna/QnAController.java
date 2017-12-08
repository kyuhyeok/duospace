package com.duospace.duospace.qna;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
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

import com.duospace.common.DuospaceUtil;
import com.duospace.member.SessionInfo;

@Controller("duospace.qnaController")
public class QnAController {

	@Autowired
	QnAService service;
	
	@Autowired
	DuospaceUtil myUtil;
	
	@RequestMapping(value="/duospace/qna/list")
	public String listInquery(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchCode",defaultValue="") String qnaCode,
			@RequestParam(value="searchKey", defaultValue="subject")String searchKey,			
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception{
		
		String cp=req.getContextPath();
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		Map<String, Object> map= new HashMap<>();
		
		map.put("searchCode", qnaCode);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		
		int rows=10;
		int dataCount=service.dataCount(map);  //데이터갯수
		int total_page=myUtil.pageCount(rows, dataCount);  //전체페이지수
		
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		List<Qna> list = service.listQna(map);  //전체리스트
		
		Iterator<Qna> it = list.iterator();
		
		int listNum, n=0;
		while(it.hasNext()) {
			Qna dto = it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		
		String query="";
		if(qnaCode.length()!=0) {
			query="searchCode="+qnaCode;
			if(searchValue.length()!=0)
				query +="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}else {
			if(searchValue.length()!=0)
				query +="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		String list_url=cp+"/duospace/qna/list";
		String article_url=cp+"/duospace/qna/article";
		
		if(query.length()!=0) {
			list_url+="?"+query;
			article_url+="?"+query+"&page="+current_page;
		}else {
			article_url+="?page="+current_page;
		}
		
		String paging=myUtil.pagingMethod(current_page, total_page, list_url);
		
		model.addAttribute("articleUrl", article_url);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		
		return ".four.duospace.gogeak.qna.list";
	}
	
	
	@RequestMapping(value="/duospace/qna/created", method=RequestMethod.GET)
	public String insertInquery(Model model) throws Exception{
		
		model.addAttribute("mode", "created");
		
		return ".four.duospace.gogeak.qna.created";
	}
	
	
	@RequestMapping(value="/duospace/qna/created", method=RequestMethod.POST)
	public String insertSubmit(
			Qna dto,
			HttpSession session
			) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		dto.setMemberNum(info.getMemberNum());
		
		service.insertQna(dto);
		
		return "redirect:/duospace/qna/list";
	}
	
}
