package com.duospace.duogram;

import java.util.List;
import java.util.Map;

public interface DuogramService {
	public int insertAccept(int memberNum);
	public int countAccept(int memberNum);
	public int insertBoard(Duogram dto);
	public int dataCount(Map<String, Object> map);
	public List<Duogram> listDuogram(Map<String, Object> map);
	public Duogram readGram(int membernum);
	public int updateGram(Duogram dto, String pathname);
	public int deleteGram(int membernum, String pathname, String name);
	
	// 리플
	public int insertReply(Reply dto);
	public int replyCountAnswer(int answer);
}
