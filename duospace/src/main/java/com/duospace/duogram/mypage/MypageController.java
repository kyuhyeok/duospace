package com.duospace.duogram.mypage;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duospace.common.FileManager;
import com.duospace.common.MyUtil;
import com.duospace.member.Member;
import com.duospace.member.SessionInfo;

@Controller("mypage.mypageController")
public class MypageController {

	@Autowired
	private MypageService service;
	
	@Autowired
	private MyUtil util;
	
	@Autowired
	private FileManager fileManager;
	
	// mypage 메인 화면
	@RequestMapping(value="/duogram/{blogNum}")
	public String duogram(
			@PathVariable int blogNum,
			Mypage dto,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		
		int cnt = service.countAccept(info.getMemberNum());
		if(cnt==0) {
			return "redirect:/duogram";
		}
		
		String me="true";
		if(info.getMemberNum()!=blogNum)
			me="false";
		
		// sns 타임라인 불러오기
		model.addAttribute("me", me);
		model.addAttribute("dto", dto);
		model.addAttribute("blogNum", blogNum);
		
		return ".userGramLayout";
	}
	
	// 글쓰기
	@RequestMapping(value="/duogram/mypage/insert", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertBorad(
			Mypage dto,
			HttpSession session
			) throws Exception {
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"duogram";
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		if(info==null) {
			state="loginFail";
		} else {
			dto.setMemberNum(info.getMemberNum());
			service.insertBoard(dto, pathname);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;	
	}
	
	// 글 수정
	@RequestMapping(value="/duogram/mypage/update", 
			method=RequestMethod.POST)
	public String updateSubmit(
			Mypage dto, 
			@RequestParam int blogNum,
			@RequestParam String page,
			HttpSession session) throws Exception {	
		// 수정 하기
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"duogram";	
	
		service.updateBoard(dto, pathname);
		return "redirect:/duogram/"+blogNum;
	}
	
	
	// 리스트
	@RequestMapping(value="/duogram/mypage/list")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam int blogNum
			) throws Exception {
		
		int rows=10;
		int dataCount;
		int total_page;
		
		Map<String, Object> map=new HashMap<>();
		map.put("blogNum", blogNum);
		dataCount=service.dataCount(map);
		total_page = util.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		int listNum, n=0;
		
		List<Mypage> list=service.listMypage(map);
		Iterator<Mypage> it=list.iterator();
		while (it.hasNext()) {
			Mypage dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		Map<String, Object> model=new HashMap<>();
		
		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		
		
		return model;
	}
	
	// 글 삭제
	@RequestMapping(value="/duogram/mypage/delete")
	public String delete(
			@RequestParam int num,
			@RequestParam int blogNum,
			@RequestParam String page,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"duogram";	
		service.deleteBoard(num, info.getMemberNum(), pathname);
		
		return "redirect:/duogram/"+blogNum;
	}
	
	// 파일삭제
	@RequestMapping(value="/duogram/mypage/deleteFile", 
			method=RequestMethod.GET)
	public String deleteFile(
			@RequestParam int num,
			@RequestParam int blogNum,
			@RequestParam String page,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Mypage dto = service.readBoard(num);
		if(dto==null) {
			return "redirect:/duogram/"+blogNum;
		}
			
		if(info.getMemberNum()!=dto.getMemberNum()) {
			return "redirect:/duogram/"+blogNum;
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "bbs";		
		if(dto.getSaveFilename() != null && dto.getSaveFilename().length()!=0) {
			  fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			  
			  dto.setSaveFilename("");
			  service.updateBoard(dto, pathname);
       }
		
		return "redirect:/duogram/"+blogNum;
	}
	
	// 댓글 달기
	@RequestMapping(value="/duogram/mypage/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			){
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		int count=0;
		if(info==null) {
			state="loginFail";
		} else {
			dto.setWriter(info.getMemberNum());
			service.insertReply(dto);
			
			if(dto.getAnswer()!=0)
				count=service.replyCountAnswer(dto.getReplyNum());
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("count", count);
		return model;
	}
	
	// 답글 리스트
	@RequestMapping(value="/duogram/mypage/listReply")
	public String listReply(
			@RequestParam(value="num") int num,
			Model model
			) {
		
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("num", num);
		
		dataCount=service.replyDataCount(map);
		List<Reply> listReply=service.listReply(map);
		
		// 엔터를 <br>로
		for(Reply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		
		// 포워딩할 jsp에 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("replyCount", dataCount);
		
		return "duoGram/main/reply";
	}
	
	@RequestMapping(value="/duogram/mypage/readuser")
	@ResponseBody
	public Map<String, Object> readuser(
			@RequestParam int blogNum
			) throws Exception {
		
		Map<String, Object> map=new HashMap<>();
		map.put("blogNum", blogNum);
		int memberNum=blogNum;
		
		Member dto=service.readMember(memberNum);
		
		Map<String, Object> model=new HashMap<>();
		
		model.put("name", dto.getName());
		model.put("email", dto.getEmail());
		return model;
	}
	
	@RequestMapping(value="/duogram/mypage/deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam int replyNum,
			HttpSession session
			) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("user");
		String state;
		
		if(info==null) {
			state="loginFail";
		} else {
			Map<String, Object> map=new HashMap<>();
			map.put("replyNum", replyNum);
			map.put("userId", info.getUserId());
			service.deleteReply(map);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	// 게시물 공감 추가
		@RequestMapping(value="duogram/mypage/insertLikeBoard", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertLikeBoard(
				Mypage dto, HttpSession session) throws Exception {
		
			SessionInfo info=(SessionInfo) session.getAttribute("user");
			String state="true";
			
			if(info==null) {
				state="loginFail";
			} else {
				dto.setMemberNum(info.getMemberNum());
				int result=service.insertLikeBoard(dto);
				if(result==0)
					state="false";
	   	    }
	   	    
			Map<String, Object> model = new HashMap<>(); 
			model.put("state", state);
			return model;
		}
		
		// 게시물 공감 개수
		@RequestMapping(value="duogram/mypage/countLikeBoard", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> countLikeBoard(
				@RequestParam(value="num") int num) throws Exception {
			
			String state="true";
			int countLikeBoard=service.countLikeBoard(num);
			
	   	    Map<String, Object> model = new HashMap<>();
	   	    model.put("state", state);
	   	    model.put("countLikeBoard", countLikeBoard);
			
	   	    // 작업 결과를 json으로 전송
	   	    return model;
		}	
	
}

