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
	public List<Faq> listFaq() {
		List<Faq> list=null;
		try {
			list=dao.selectList("duospace.faq.faqList");
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}
	
	@Override
	public List<Faq> listQnaCate() {
		List<Faq> list=null;
		try {
			list=dao.selectList("duospace.faq.qnacateList");
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public int updateFaq(Faq dto) {
		int result=0;
		try {
			result=dao.updateData("duospace.faq.update", dto);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public int deleteFaq(int num) {
		int result=0;
		try {
			result=dao.deleteData("duospace.faq.delete", num);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public Faq readFaq(int num) {
		Faq dto = null;
		try {
			dto=dao.selectOne("duospace.faq.readFaq", num);
		} catch (Exception e) {
			e.toString();
		}
		return dto;
	}

	

}
