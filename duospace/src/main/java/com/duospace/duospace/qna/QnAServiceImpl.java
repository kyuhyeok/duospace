package com.duospace.duospace.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duospace.qnaService")
public class QnAServiceImpl implements QnAService{

	@Autowired
	CommonDAO dao;
	
	@Override
	public int insertQna(Qna dto) {
		int result=0;
		try {
			dao.insertData("duospace.qna.insert", dto);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna readQna(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateQna(Qna dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQna(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Qna preReadQna(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna nextReadQna(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
