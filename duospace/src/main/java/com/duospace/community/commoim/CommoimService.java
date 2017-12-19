package com.duospace.community.commoim;

import java.util.List;
import java.util.Map;

public interface CommoimService {
	public int insertAccept(Map<String, Object>map);//모임가입.
	public int countAccept(Map<String, Object>map);

	public int insertCommoim(Commoim dto);//모임생성
	public List<Commoim> listCommoim(Map<String, Object> map);//모임 리스트
	
}
