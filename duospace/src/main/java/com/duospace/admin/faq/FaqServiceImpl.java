package com.duospace.admin.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("admin.faqService")
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	CommonDAO dao;

	@Override
	public int insertFaq(Faq dto) {
		int result=0;
		try {
			result=dao.insertData("duospace.faq.created", dto);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list=null;
		try {
			list=dao.selectList("duospace.faq.faqList", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public int updateFaq(Faq dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFaq(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}
