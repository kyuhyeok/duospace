package com.duospace.duospace.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.admin.faq.Faq;
import com.duospace.common.dao.CommonDAO;

@Service("duospace.service")
public class FaQServieImpl implements FaQService {

	@Autowired
	   CommonDAO dao;

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

}
