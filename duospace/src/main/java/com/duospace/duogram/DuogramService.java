package com.duospace.duogram;

import java.util.List;
import java.util.Map;

public interface DuogramService {
	public int insertAccept(int memberNum);
	public int countAccept(int memberNum);
	public int insertBoard(Duogram dto);
	public int dataCount(Map<String, Object> map);
	public List<Duogram> listDuogram(Map<String, Object> map);
	public int deleteBoard(int num, int memberNum);
	public Duogram readBoard(int num);
	public int updateBoard(Duogram dto);
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyCountAnswer(int answer);
}
