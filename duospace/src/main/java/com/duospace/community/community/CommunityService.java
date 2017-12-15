package com.duospace.community.community;

import java.util.List;
import java.util.Map;




public interface CommunityService {
	public int insertCommunity(Community dto);
	public int dataCount(Map<String, Object> map);
	public List<Community> listCommunity(Map<String, Object> map);
	public Community readBoard(int num);
	public int updateHitCount(int num);
	public Community preReadBoard(Map<String, Object> map);
	public Community nextReadBoard(Map<String, Object> map);
	public int updateCommunity(Community dto);
	public int deleteCommunity(int num ,String userId);
	
	
	//답글
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	public int replyCount(int num);
	

	
}
