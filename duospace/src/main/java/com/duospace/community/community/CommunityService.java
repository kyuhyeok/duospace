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
	
}
