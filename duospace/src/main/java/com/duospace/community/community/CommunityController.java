package com.duospace.community.community;

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
import com.duospace.community.commaincate.Commaincate;
import com.duospace.member.SessionInfo;

@Controller("community.communityController")
public class CommunityController {
	@Autowired
	private CommunityService service;
	@Autowired
	private DuospaceUtil myUtil;
	
	
	@RequestMapping(value="/community/list")
	public String list(
			@RequestParam int cateNum,
			@RequestParam(value="page",defaultValue="1") int current_page,
			@RequestParam(value="searchKey",defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue",defaultValue="") String searchValue,
			HttpServletRequest req,
			Commaincate dto,
			Model model
			)throws Exception {
		
		String cp = req.getContextPath();
		int rows=5;
		int total_page = 0;
		int dataCount;
		if(req.getMethod().equalsIgnoreCase("GET")) {//GET방식인 경우
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		//전체 페이지 수
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("cateNum", cateNum);
		
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
		
		//리스트 번호
		int listNum,n=0;
		Iterator<Community> it = list.iterator();
		while(it.hasNext()) {
			Community data = it.next();
			listNum = dataCount - (start + n - 1 );
			data.setListNum(listNum);
			n++;
		}		
		
		//페이징
		String query="";//빈방잡고..
		String listUrl = cp+"/community/list?cateNum="+cateNum;//제일처음페이지 검색도안하고 페이지도안넘기면
		String articleUrl = cp+"/community/article?cateNum="+cateNum+"&page="+current_page;
		
		if(searchValue.length() != 0) {//검색을했으면. query에 Key||Value를 넣고.
			query+= " &searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		if(query.length()!=0) {//검색안하고 페이지만넘겼으면 페이지만 추가한다.
			listUrl = cp+"community/list?cateNum="+cateNum+"&"+query;
			articleUrl = cp+"community/article?cateNum="+cateNum+"&page="+current_page+"&"+query;
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, listUrl);
		
		model.addAttribute("cateNum",cateNum);
		model.addAttribute("list",list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("paging", paging);	
		
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
			Community dto,
			HttpSession session,
			Model model
			)throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		dto.setMemberNum(info.getMemberNum());
		service.insertCommunity(dto);
		
		int memberNum = info.getMemberNum();
		
		model.addAttribute("memberNum",memberNum);
		
		model.addAttribute("cateNum",dto.getCateNum());
		
		return "redirect:/community/list";
	}
	
	
	@RequestMapping(value="/community/article")
	public String article(
			@RequestParam int cateNum,
			@RequestParam (value="boardNum") int boardNum,
			@RequestParam (value="page") String page,
			@RequestParam (value="searchKey",defaultValue="subject") String searchKey,
			@RequestParam (value="searchValue",defaultValue="") String searchValue,
			HttpSession session,
			Model model
			)throws Exception {
		searchValue = URLDecoder.decode(searchValue, "utf-8");

		//조회수 증가
		service.updateHitCount(boardNum);
		
		//해당 레코드 가져오기
		Community dto = service.readBoard(boardNum);
		if(dto==null)
			return "redirect:/community/list?page="+page;
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("boardNum", boardNum);
		
		Community preReadDto = service.preReadBoard(map);
		Community nextReadDto = service.nextReadBoard(map);
		
		
		
		
		
		String query = "cateNum="+cateNum+"&page="+page;
		if(searchValue.length()!=0) {
			query += "&searchKey="+searchKey +  
					"&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
			
		}

		model.addAttribute("cateNum",cateNum);
		model.addAttribute("dto",dto);
		model.addAttribute("page",page);
		model.addAttribute("query",query);
		
		
		model.addAttribute("preReadDto",preReadDto);
		model.addAttribute("nextReadDto",nextReadDto);
		return ".community.community.article";
	}
	
	@RequestMapping(value="/community/update",method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int cateNum,
			@RequestParam int boardNum,
			@RequestParam String page,
			HttpSession session,
			Model model
			)throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		Community dto = service.readBoard(boardNum);
		
		if(dto==null) {
			return "redirect:/community/list?cateNum="+cateNum+"&page="+page;
		}
		
		if(! info.getUserId().equals(dto.getEmail())) {
			return "redirect:/community/list?cateNum="+cateNum+"&page="+page;
		}
		
		model.addAttribute("dto",dto);
		model.addAttribute("cateNum",cateNum);
		model.addAttribute("boardNum",boardNum);
		model.addAttribute("mode","update");
		model.addAttribute("page",page);
		
		return ".community.community.created";
	}
	
	@RequestMapping(value="/community/update",method=RequestMethod.POST)
	public String updateSubmit(
			@RequestParam int cateNum,
			@RequestParam int boardNum,
			@RequestParam String page,
			Community dto,
			HttpSession session,
			Model model
			)throws Exception {
		
		service.updateCommunity(dto);
		model.addAttribute("cateNum",cateNum);
		
		return "redirect:/community/list?cateNum="+cateNum+"&page="+page;
	}
	
	@RequestMapping(value="community/delete")
	public String delete(
			@RequestParam int cateNum,
			@RequestParam int boardNum,
			@RequestParam int page,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		service.deleteCommunity(boardNum,info.getUserId());

		model.addAttribute("cateNum",cateNum);
		
		return "redirect:/community/list?page="+page;
	}
	
	
	
	
	
	
	
	
	
	
	
}
