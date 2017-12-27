package com.duospace.community.commoim;

import java.util.List;
import java.util.Map;

public interface CommoimService {
	public int insertAccept(Map<String, Object>map);//모임가입.
	public int countAccept(Map<String, Object>map);
	public Commoim readcmoim(int cmoimCode);
	public int insertCommoim(Commoim dto);//모임생성
	public List<Commoim> listCommoim(Map<String, Object> map);//나의모임 리스트
	public List<Commoim> list(Map<String, Object> map);//전체모임 리스트

	public int cmoimSeq();//모인 시퀀스 가져오기.
	public int dataCount(Map<String, Object>map);//나의 모임 가입수
	public int dataCountAll();//모임 전체수
}
