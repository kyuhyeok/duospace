package com.duospace.admin.meachul;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.common.DuospaceUtil;

@Controller("admin.meachulController")
public class MeachulController {
	
	@Autowired
	private MeachulService service;
	
	@Autowired
	private DuospaceUtil myUtil;
	
	@RequestMapping("/admin/meachul/list")
	public String meachulList(
			@RequestParam(value="page", defaultValue="1") int current_page
			,@RequestParam(value="rows", defaultValue="10") int rows
			,@RequestParam(value="searchKey", defaultValue="subject") String searchKey
			,@RequestParam(value="searchValue", defaultValue="") String searchValue
			,HttpServletRequest req
			,Model model
			) throws Exception {
		
		String cp= req.getContextPath();

		Map<String, Object> map = new HashMap<>();
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		
		int dataCount=service.dataCount(map);
		int total_page=0;
		
		if(dataCount!=0) {
		  total_page=myUtil.pageCount(rows, dataCount);
		}
		
		if(current_page>total_page)
			current_page=total_page;
			
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Meachul> list = service.mechulList(map);
		
		int n=0, listNum;
		
		for(Meachul dto: list) {
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		
		String query ="rows="+rows;
		String listUrl= cp+"/duospace/notice/list";
		
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
			
		}
		
		listUrl=cp+"/admin/meachul/list?"+query;
		
		String paging = myUtil.paging2Method(current_page, total_page, listUrl);
			
		model.addAttribute("paging", paging);
		model.addAttribute("page", current_page);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("total_page", total_page);
		model.addAttribute("rows", rows);
		
		return ".admin4.menu3.meachul.meachullist";
	}

}
