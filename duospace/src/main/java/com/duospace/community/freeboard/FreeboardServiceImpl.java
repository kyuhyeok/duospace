package com.duospace.community.freeboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("freeboard.freeboardService")
public class FreeboardServiceImpl implements FreeboardService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertFreeboard(Freeboard dto) {
		int result=0;
		try {
			result=dao.insertData("freeboard.insertFreeboard",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Freeboard> listFreeboard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Freeboard readFreeboard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateFreeboard(Freeboard dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFreeboard(int num, String pathname, String memberNum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
