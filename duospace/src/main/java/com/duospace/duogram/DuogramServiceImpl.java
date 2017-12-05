package com.duospace.duogram;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duogram.duogramService")
public class DuogramServiceImpl implements DuogramService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertBoard(Duogram dto) {
		int result=0;
		try {
			result=dao.insertData("duogram.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Duogram> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Duogram readBoard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Duogram preReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Duogram nextReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(Duogram dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int num, String pathname, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReply(Reply dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyCountAnswer(int answer) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
