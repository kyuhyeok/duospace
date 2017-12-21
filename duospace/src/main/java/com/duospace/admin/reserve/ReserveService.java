package com.duospace.admin.reserve;

import java.util.List;
import java.util.Map;

public interface ReserveService {
	public List<Reserve> reserveList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int delete(int rmresNum) throws Exception;
	
}
