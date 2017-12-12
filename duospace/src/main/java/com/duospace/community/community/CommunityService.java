package com.duospace.community.community;

import java.util.List;
import java.util.Map;

public interface CommunityService {
	public int insertCommunity(Community dto);
	public int dataCount(Map<String, Object> map);
	public List<Community> listCommunity(Map<String, Object> map);
}
