package com.duospace.admin.faq;

import java.util.List;

public interface FaqService {

	public int insertFaq(Faq dto);
	public List<Faq> listFaq();
	public List<Faq> listQnaCate();
	public int updateFaq(Faq dto);
	public int deleteFaq(int num);
	public Faq readFaq(int num);
	
}
