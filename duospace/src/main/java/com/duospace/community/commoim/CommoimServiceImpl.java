package com.duospace.community.commoim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("commoim.commoimService")
public class CommoimServiceImpl implements CommoimService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertCommoim(Commoim dto) {
		int result=0;
		try {
			result=dao.insertData("commoim.insertCommoim", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
