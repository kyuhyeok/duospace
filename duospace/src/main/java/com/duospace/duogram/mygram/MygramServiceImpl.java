package com.duospace.duogram.mygram;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service
public class MygramServiceImpl implements MygramService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int countAccept(int memberNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertGraminfo(Mygram dto) {
		int result=0;
		try {
			result=dao.insertData("mygram.mygramInsertGram", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
