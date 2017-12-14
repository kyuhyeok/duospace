package com.duospace.duospace.rmres;

import org.springframework.beans.factory.annotation.Autowired;

import com.duospace.common.dao.CommonDAO;

public class RmresServiceImpl implements RmresService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertRmres(Rmres dto) {
		int result=0;
		try {
			result=dao.insertData("duospace.rmres.insert", dto);
			result=dao.insertData("duospace.rmres.insert2", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

}
