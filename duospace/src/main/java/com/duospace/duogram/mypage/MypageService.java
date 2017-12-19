package com.duospace.duogram.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public int insertAccept(int memberNum);
	public int countAccept(int memberNum);
	public int insertBoard(Mypage dto);
	public int dataCount(Map<String, Object> map);
	public List<Mypage> listMypage(Map<String, Object> map);
	public int deleteBoard(int num, int memberNum);
	public Mypage readBoard(int num);
	public int updateBoard(Mypage dto);
	
	// 댓글
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyCountAnswer(int answer);
}
