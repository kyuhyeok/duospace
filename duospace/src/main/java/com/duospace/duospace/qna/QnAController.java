package com.duospace.duospace.qna;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
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
		
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		List<Qna> list = service.listQna(map);  //전체리스트
		
		Iterator<Qna> it = list.iterator();
		
		
		
		//new 이미지 넣기
		long gap;
		Date endDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		int listNum, n=0;
		while(it.hasNext()) {
			Qna dto = it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
			
			Date beginDate = sdf.parse(dto.getCreated());
			//날짜시간차이
			gap=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);
			dto.setGap(gap);
			dto.setCreated(dto.getCreated().substring(0, 10));
		}
		
		
		String query="";
		if(qnaCode.length()!=0) {
			query="searchCode="+qnaCode;
			if(searchValue.length()!=0)
				query +="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}else {
			if(searchValue.length()!=0)
				query +="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		String list_url=cp+"/duospace/qna/list";
		String article_url=cp+"/duospace/qna/article";
		
		if(query.length()!=0) {
			list_url+="?"+query;
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
		
		service.insertQna(dto,"created");
		
		return "redirect:/duospace/qna/list";
	}
	
	@RequestMapping(value="/duospace/qna/article", method=RequestMethod.GET)
	public String readInquery(
			@RequestParam(value="searchCode",defaultValue="") String qnaCode,
			@RequestParam(value="searchKey", defaultValue="subject")String searchKey,			
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam int num,
			@RequestParam String page,
			Model model,
			HttpServletRequest req
			) throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchCode", qnaCode);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		
		Qna dto= service.readQna(num);
		
		if(dto==null)
			return "redirect:/duospace/qna/list?page="+page;
		
		map.put("num", dto.getNum());
		map.put("groupNum", dto.getGroupNum());
		map.put("answer", dto.getAnswer());
	
		Qna preDto=service.preReadQna(map);
		Qna nextDto=service.nextReadQna(map);
		
		
		
		String query="page="+page;
		if(qnaCode.length()!=0) {
			query+="&searchCode="+qnaCode;
			if(searchValue.length()!=0) {
				query+="&searchValue="+searchValue+"&searchKey="+searchKey;
			}	
		}else {
			if(searchValue.length()!=0) {
				query+="&searchValue="+searchValue+"&searchKey="+searchKey;
			}
		}
		
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("preDto", preDto);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("searchCode", qnaCode);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("query", query);
		
		return ".four.duospace.gogeak.qna.article";
	}
	
	@RequestMapping(value="/duospace/qna/update", method=RequestMethod.GET)
	public String updateInquery(
			@RequestParam(value="searchCode",defaultValue="") String qnaCode,
			@RequestParam(value="searchKey", defaultValue="subject")String searchKey,			
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam int num,
			@RequestParam String page,
			Model model) throws Exception{
		
		Qna dto = service.readQna(num);
		if(dto==null)
			return "redirce:/duospace/qna/list?page="+page;
	
		
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("searchCode", qnaCode);
		model.addAttribute("page", page);
		
		return ".four.duospace.gogeak.qna.created";
	}
	
	@RequestMapping(value="/duospace/qna/update", method=RequestMethod.POST)
	public String updateSubmit(Qna dto,
			@RequestParam(value="searchCode",defaultValue="") String searchCode,
			@RequestParam(value="searchKey", defaultValue="subject")String searchKey,			
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam String page
			) throws Exception{
		
		service.updateQna(dto);
		
		String query="page="+page;
		if(searchCode.length()!=0) {
			query+="&searchCode="+searchCode;
		}
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		
		return "redirect:/duospace/qna/list?"+query;
	}
	
	@RequestMapping(value="/duospace/qna/delete", method=RequestMethod.GET)
	public String delete(int num, @RequestParam String page)throws Exception{
		service.deleteQna(num);
		return "redirect:/duospace/qna/list?page="+page;
	}
	
	
	@RequestMapping(value="/duospace/qna/reply", method=RequestMethod.GET)
	public String reply(
			@RequestParam int num,
			@RequestParam String page,
			Model model
			) throws Exception{
		
		Qna dto = service.readQna(num);
		if(dto==null)
			return "redirect:/duospace/qna/list?page="+page;
		
		String str = "["+dto.getSubject()+"]에 대한 답변입니다.";
		dto.setContent(str);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "reply");
		model.addAttribute("page", page);
			
		return  ".four.duospace.gogeak.qna.created";
	}
	
	@RequestMapping(value="/duospace/qna/reply", method=RequestMethod.POST)
	public String replySubmit(
			Qna dto,
			@RequestParam String page,
			Model model,
			HttpSession session
			) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		dto.setMemberNum(info.getMemberNum());
		
		service.insertQna(dto,"reply");
		
		return "redirect:/duospace/qna/list?page="+page;
	}
	
	@RequestMapping(value="/duospace/qna/deleteList", method=RequestMethod.POST)
	public String deleteList(
			@RequestParam Integer [] nums,
			@RequestParam String page,
			@RequestParam(value="searchCode",defaultValue="") String searchCode,
			@RequestParam(value="searchKey", defaultValue="subject")String searchKey,			
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			)throws Exception{
		
		List<Integer> list = Arrays.asList(nums);
		service.deleteList(list);
		
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		if(searchCode.length()!=0)
			query+="&searchCode="+searchCode;
		
		return "redirect:/duospace/qna/list?"+query;
	}
}









