package com.duospace.community.commaincate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("commaincate.commaincateService")
public class CommaincateServiceImpl implements CommaincateService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int insertCommaincate(Commaincate dto) {
		int result=0;
		try {
			result=dao.insertData("commaincate.insertcommaincate",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
