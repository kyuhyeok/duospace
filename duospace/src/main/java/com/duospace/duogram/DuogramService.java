package com.duospace.duogram;

import java.util.List;
import java.util.Map;

public interface DuogramService {
	public int insertBoard(Duogram dto);
	public List<Duogram> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Duogram readBoard(int num);
	public int updateHitCount(int num);
	public Duogram preReadBoard(Map<String, Object> map);
	public Duogram nextReadBoard(Map<String, Object> map);
	public int updateBoard(Duogram dto, String pathname);
	public int deleteBoard(int num, String pathname, String userId);
	
	// 답글
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyCountAnswer(int answer);
}
