package com.duospace.community.freeboard;

import java.util.List;
import java.util.Map;

public interface FreeboardService {
	
	public int insertFreeboard(Freeboard dto);
	public List<Freeboard> listFreeboard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Freeboard readFreeboard(int num);
	public int updateFreeboard(Freeboard dto,String pathname);
	public int deleteFreeboard(int num,String pathname,String memberNum);
	
	public int insertReply(Reply dto);//댓글
	public List<Freeboard> listReply(Map<String, Object> map);//댓글리스트
	public int replyDataCount(Map<String, Object> map);//댓글갯수
	public int deleteReply(Map<String, Object> map);//댓글삭제

}
