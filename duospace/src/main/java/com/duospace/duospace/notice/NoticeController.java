package com.duospace.duospace.notice;


import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duospace.common.DuospaceUtil;
import com.duospace.common.FileManager;

@Controller("duospace.noticeController")
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	@Autowired
	private DuospaceUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/duospace/notice/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page
			,@RequestParam(value="rows", defaultValue="10") int rows
			,@RequestParam(value="searchKey", defaultValue="subject") String searchKey
			,@RequestParam(value="searchValue", defaultValue="") String searchValue
			,HttpServletRequest req
			,Model model
			) throws Exception {
		
		String cp=req.getContextPath();
		
		Map<String, Object> map = new HashMap<>();
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue,"UTF-8");
		}
			
		int total_page=0;
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		int dataCount = service.dataCount(map);  //데이터갯수
	
		
		if(dataCount!=0) {
			total_page=myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page<current_page)
			current_page=total_page;
		
		
		//리스트에 출력할 데이터 가져오기
		int start = (current_page-1)*rows + 1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		//글리스트
		List<Notice> list = service.listNotice(map);
		
		List<Notice> listTop = null;
		if(current_page==1)
			listTop=service.listNoticeTop();
		
		//리스트의 번호
		int listNum, n=0;
		for(Notice dto:list) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String query ="rows="+rows;
		String listUrl= cp+"/duospace/notice/list";
		String articleUrl;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
			
		}
		
			listUrl=cp+"/duospace/notice/list?"+query;
			articleUrl=cp+"/duospace/notice/article?page="+current_page+"&"+query;
		
		
		String paging = myUtil.pagingMethod(current_page, total_page, listUrl);
		
		model.addAttribute("mode", "created");
		model.addAttribute("listTop", listTop);
		model.addAttribute("paging", paging);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("total_page", total_page);
		model.addAttribute("rows", rows);
		
		return ".four.duospace.gogeak.notice.list";
	}
	
	@RequestMapping(value="/duospace/notice/created", method=RequestMethod.GET)
	public String createdNotice(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		
		return ".four.duospace.gogeak.notice.created"; //jsp
	}
	
	@RequestMapping(value="/duospace/notice/created", method=RequestMethod.POST)
	public String createdSubmit(Notice dto,
			HttpSession session) throws Exception{
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+File.separator+"uploads"+File.separator+"notice";
		
		
		service.insertNotice(dto, pathname);
	
		
		return "redirect:/duospace/notice/list";
	}
	
	@RequestMapping(value="/duospace/notice/article")
	public String readNotice(
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="num") int num,
			@RequestParam(value="rows", defaultValue="10") String rows,
			@RequestParam(value="page") String page,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		//String cp = req.getContextPath();
		
		service.updateHitCount(num);
		
		Notice dto = service.readNotice(num);
		
		if(searchValue.length()!=0) {
			searchValue=URLDecoder.decode(searchValue,"utf-8");
		}
		
		if(dto==null) {
			return "redirect:/duospace/notice/list?page="+page;
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("num", num);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		Notice preDto=service.preReadNotice(map);
		Notice nextDto=service.nextReadNotice(map);
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		
		String query="page="+page+"&rows="+rows;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("dto", dto);
		model.addAttribute("rows", rows);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("preDto", preDto);
		model.addAttribute("nextDto", nextDto);

		
		
		
		return ".four.duospace.gogeak.notice.article";
	}
	
	@RequestMapping(value="/duospace/notice/update", method=RequestMethod.GET)
	public String updateNotice(
			@RequestParam(value="num") int num,
			@RequestParam(value="page")String page,
			Model model
			) throws Exception{
		
		Notice dto = service.readNotice(num);
		if(dto==null)
			return "redirect:/duospace/notice/list?page="+page;
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		
		return ".four.duospace.gogeak.notice.created";
	}
	
	@RequestMapping(value="/duospace/notice/update", method=RequestMethod.POST)
	public String updateSuibmit(Notice dto, @RequestParam String page, HttpSession session) throws Exception{
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+File.separator+"uploads"+File.separator+"notice";
		
		service.updateNotice(dto, pathname);
		
		return "redirect:/duospace/notice/list?page="+page;
	}
	
	@RequestMapping(value="/duospace/download", method=RequestMethod.GET)
	public void download(
			@RequestParam int num,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"notice";
		
		Notice dto = service.readNotice(num);
		boolean flag=false;
		
		if(dto!=null) {
			flag=fileManager.doFileDownload(dto.getSaveFilename(),
					dto.getOriginalFilename(), pathname, resp);
		}
		
		if(! flag) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('파일 다운로드가 실패했습니다.');history.back();</script>");
		}
		
	}
	
	
	//첨부된 파일 삭제
	@RequestMapping(value="/duospace/deleteFile", method=RequestMethod.GET)
	public String deleteFile(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session
			) throws Exception{
		
		//db에서 dto가져오기
		Notice dto = service.readNotice(num);
		
		if(dto==null) {
			return "redirect:/duospace/notice/list?page="+page;
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"notice";
		
		if(dto.getSaveFilename() !=null && dto.getSaveFilename().length() !=0) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			dto.setSaveFilename("");
			dto.setOriginalFilename("");
			service.updateNotice(dto, pathname);
		}
		
		return "redirect:/duospace/notice/update?page="+page;  //파일 삭제후 업데이트로 다시 이동
	}
	
	
	//공지사항삭제
	@RequestMapping(value="/duospace/notice/delete", method=RequestMethod.GET)
	public String deleteNotice(
			@RequestParam String page,
			@RequestParam int num,
			@RequestParam String rows,
			HttpSession session
			) throws Exception{
		
		Notice dto = service.readNotice(num);
		if(dto==null) {
			return "redirect:/duospace/notice/list?page="+page;
		}
		
		if(dto.getSaveFilename()!=null && dto.getSaveFilename().length() !=0) {
			//서버에서 첨부파일 삭제
			String root = session.getServletContext().getRealPath("/");
			String pathname=root+File.separator+"uploads"+File.separator+"notice";
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}
		
		service.deleteNotice(dto.getNum());
		
		
		return "redirect:/duospace/notice/list?page="+page+"&rows="+rows;
	}
	
	@RequestMapping(value="/duospace/notice/deleteList", method=RequestMethod.POST)
	public String deleteList(
			@RequestParam Integer[] nums,
			@RequestParam String page,
			@RequestParam String rows,
			HttpSession session
			) throws Exception{	
		//Arrays.asList(nums) []==>List로
		List<Integer> list = Arrays.asList(nums);
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"notice";
		
		//첨부파일삭제
		for(Integer num:list) {
			Notice dto=service.readNotice(num);
			if(dto!=null&&dto.getSaveFilename()!=null&&dto.getSaveFilename().length() !=0) {

					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			}
		}
		
		//리스트삭제
		service.deleteListNotice(list);
	

		return "redirect:/duospace/notice/list?page="+page+"&rows="+rows;
	}
}






























