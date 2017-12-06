package com.duospace.admin.spot;

import java.util.List;
import java.util.Map;

public interface SpotService {
	public int insertSpot(Spot dto);
	public List<Spot> listSpot(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Spot readSpot(int spotCode);
	public int updateSpot(Spot dto, String pathname);
	public int deleteListSpot(List<Integer> list);
	
}
