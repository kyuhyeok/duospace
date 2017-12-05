package com.duospace.duospace.epilogue;

import java.util.List;
import java.util.Map;

public interface epilogueService {
	public int insertReview(epilogue dto, String pathname);
	public List<epilogue> listReview(Map<String, Object> map);
	public int dataCount(Map<String,Object> map);
	public epilogue readReview(int reservnum);
	public int updateHitCount(int reservnum);
	public int updateReview(epilogue dto, String pathname);
	public int deleteReview(int reservnum, String pathname, String userId);
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	
	
	
}
