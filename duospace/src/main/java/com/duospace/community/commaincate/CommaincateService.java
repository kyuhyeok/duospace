package com.duospace.community.commaincate;

import java.util.List;
import java.util.Map;

public interface CommaincateService {
	public int insertCommaincate(Commaincate dto);
	public List<Commaincate> listCommaincate(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	
	
	
	
}
