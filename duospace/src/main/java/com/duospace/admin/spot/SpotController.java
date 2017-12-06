package com.duospace.admin.spot;

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

@Controller("admin.spot.SpotController")
public class SpotController {
	@Autowired
	private SpotService service;
	
	@Autowired
	private DuospaceUtil myUtil;
	
	@RequestMapping(value="/admin/spot/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		
		return".admin4.menu3.spot.created";
	}
	
	@RequestMapping(value="/admin/spot/created", method=RequestMethod.POST)
	public String createdSubmit(
			Spot dto
			) throws Exception{
		
		service.insertSpot(dto);
		
		return "redirect:/admin/spotlist";
	}
	
	@RequestMapping(value="/admin/spotlist")
	public String list(
			HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="spotName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model
			) throws Exception{
			String cp = req.getContextPath();
		
			int rows=10;
			int total_page=0;
			int dataCount=0;
			
			if(req.getMethod().equalsIgnoreCase("GET")) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
			Map<String, Object> map= new HashMap<>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			
			dataCount= service.dataCount(map);
			
			if(dataCount!=0) {
				total_page=myUtil.pageCount(rows, dataCount);
			}
			if(total_page<current_page) {
				current_page= total_page;
			}
			int start = (current_page-1)*rows + 1;
			int end = current_page*rows;
			map.put("start", start);
			map.put("end", end);
			List<Spot> list=service.listSpot(map);
			
			String query="";
			String listUrl;
			String articleUrl;
			if(searchValue.length()!=0){
				query = "searchKey="+searchKey + "&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
			}
			
			listUrl = cp+"spot/list";
			articleUrl = cp+"spot/article?page="+current_page;
			
			if(query.length()!=0) {
				listUrl = listUrl + "?" + query;
				articleUrl = articleUrl+"&"+query;
			}
			
			String paging = myUtil.pagingMethod(current_page, total_page, listUrl);
			
			model.addAttribute("paging", paging);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("listUrl", listUrl);
			model.addAttribute("query", query);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchValue", searchValue);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("list", list);
			model.addAttribute("rows", rows);
			
		return ".admin4.menu3.spot.spotlist";
	}
}
