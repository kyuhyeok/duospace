package com.duospace.admin.meachul;

import java.util.List;
import java.util.Map;

public interface MeachulService {
	
	public List<Meachul> mechulList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);

}
