package com.duospace.community.moim;

import java.util.List;
import java.util.Map;

public interface MoimService {
	public int insertAccept(Map<String, Object>map);//모임가입.
	public int countAccept(Map<String, Object>map);
	public int insertMoim(Moim dto);
	public List<Moim> listMoim(Map<String, Object>map);
	public int dataCount(int cmoimCode);
	public Moim readMoim(int num);
	public int updateHitCount(int num);
	public int updateMoim(Moim dto);
	public int deleteMoim(int num);
	
	public List<Moim> listMoimMember(Map<String, Object> map);//모임 멤버 리스트
	
}
