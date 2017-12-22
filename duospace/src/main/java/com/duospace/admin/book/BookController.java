package com.duospace.admin.book;

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

@Controller("admin.book.BookController")
public class BookController {
	
	@Autowired
	private BookService service;
	
	@Autowired
	private DuospaceUtil myUtil;
	
	@RequestMapping(value="/admin/book/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		
		List<Bcategory> listBcategory=service.listBcategory();
		
		model.addAttribute("mode", "created");
		model.addAttribute("listBcategory", listBcategory);
		
		return".admin4.menu3.book.created";
	}

	@RequestMapping(value="/admin/book/created", method=RequestMethod.POST)
	public String createdSubmit(
			Book dto
			) throws Exception{
		
		service.insertBook(dto);
		return "redirect:/admin/booklist";
	}
	/*
	@RequestMapping(value="/admin/bookList")
	@ResponseBody
	public Map<String, Object> bookList(int signNum) throws Exception{
		
		Map<String, Object> map=new HashMap<>();
		List<Book> list=service.listBook(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		
		return model;
	}
	*/
	@RequestMapping(value="/admin/booklist")
	public String list(
			HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="rows", defaultValue="10") int rows,
			@RequestParam(value="searchKey", defaultValue="bookName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="")String searchValue,
			Model model
			) throws Exception{
		
		String cp= req.getContextPath();
		
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		Map<String, Object> map=new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;
		
		int start= (current_page-1)*rows +1;
		int end= current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Book> list=service.listBook(map);
		
		String query="rows="+rows;
		String listUrl=cp+"/duospace/book/list";
		if(searchValue.length()!=0) {
			query = "searchKey="+searchKey + "&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		
		listUrl=cp+"/admin/booklist?"+query;
		
		String paging = myUtil.paging2Method(current_page, total_page, listUrl);
		
		model.addAttribute("paging",paging);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("rows", rows);
		
		return ".admin4.menu3.book.booklist";
}
}