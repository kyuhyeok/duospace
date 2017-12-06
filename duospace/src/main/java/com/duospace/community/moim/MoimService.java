package com.duospace.community.moim;

import java.util.List;
import java.util.Map;

public interface MoimService {
	public int insertMoim(Moim dto);
	public List<Moim> listMoim(Map<String, Object>map);
	public int dataCount(Map<String, Object>map);
	public Moim readMoim(int num);
	public int updateHitCount(int num);
	public int updateMoim(Moim dto);
	public int deleteMoim(int num);
	
}