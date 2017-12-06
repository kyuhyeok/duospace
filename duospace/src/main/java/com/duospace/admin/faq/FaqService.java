package com.duospace.admin.faq;

import java.util.List;
import java.util.Map;

public interface FaqService {

	public int insertFaq(Faq dto);
	public List<Faq> listFaq(Map<String, Object> map);
	public int updateFaq(Faq dto);
	public int deleteFaq(int num);
	
}
