package com.duospace.admin.room;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.duospace.admin.floor.Floor;
import com.duospace.common.DuospaceUtil;
import com.duospace.common.FileManager;


@Controller("admin.room.RoomController")
public class RoomController {
	@Autowired
	private RoomService service;

	@Autowired
	private DuospaceUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/admin/floorList", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> floorList(int spotCode) throws Exception{
		List<Floor> list=service.listFloor(spotCode);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		
		return model;
	}
	
	@RequestMapping(value="/admin/roomlist")
	public String list(
			HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="rows", defaultValue="10") int rows,
			@RequestParam(value="searchKey", defaultValue="roomCode") String searchKey,
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
		
		List<Room> list =service.listRoom(map);
		
		String query="rows="+rows;
		String listUrl=cp+"/duospace/room/list";
		if(searchValue.length()!=0){
			query = "searchKey="+searchKey + "&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
		}
		
		listUrl=cp+"/admin/roomlist?"+query;
		String paging = myUtil.paging2Method(current_page, total_page, listUrl);
		
		model.addAttribute("paging", paging);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("rows", rows);
		
		return ".admin4.menu3.room.roomlist";
	}
	
	@RequestMapping(value="/admin/room/created", method=RequestMethod.GET)
	public String CreatedForm(Model model) throws Exception{
		
		List<Room> flist =service.flistRoom();
		List<Room> slist =service.slistRoom();
		
		model.addAttribute("mode", "created");
		model.addAttribute("flist", flist);
		model.addAttribute("slist", slist);
		return ".admin4.menu3.room.created";
	}
	
	@RequestMapping(value="/admin/room/created", method=RequestMethod.POST)
	public String CreatedSubmit(
			Room dto,
			HttpSession session
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+File.separator+"resource"+File.separator+"images"+File.separator+"duospace"+File.separator+"Room";
		
		service.insertRoom(dto, pathname);
		
		return "redirect:/admin/roomlist";
	}
	
	@RequestMapping(value="/admin/room/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="roomCode") int roomCode,
			@RequestParam(value="page")String page,
			@RequestParam(value="spotCode",defaultValue="0")int spotCode,
			Model model
			) throws Exception{
		List<Room> slist =service.slistRoom();
		List<Room> flist =service.flistRoom();
		Room dto =service.readRoom(roomCode);
		if(dto==null)
			return "redirect:/admin/roomlist?page="+page+"&spotCode="+spotCode;
		model.addAttribute("flist", flist);
		model.addAttribute("slist", slist);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		
		return ".admin4.menu3.room.created";
	}
	
	@RequestMapping(value="/admin/room/update", method=RequestMethod.POST)
	public String updateSubmit(
			Room dto,
			@RequestParam String page,
			HttpSession session
			) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+File.separator+"resource"+File.separator+"images"+File.separator+"duospace"+File.separator+"Room";
		
		
		
		service.updateRoom(dto, pathname);
		
		return "redirect:/admin/roomlist?page="+page;
	}
}
