package com.duospace.community.commoim;

import java.util.List;
import java.util.Map;

public interface CommoimService {
	public int insertCommoim(Commoim dto);
	public List<Commoim> listCommoim(Map<String, Object> map);
}
