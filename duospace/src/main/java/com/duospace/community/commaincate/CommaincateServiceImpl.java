package com.duospace.community.commaincate;

import java.util.List;
import java.util.Map;

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


	@Override
	public List<Commaincate> listCommaincate(Map<String, Object> map) {
		List<Commaincate> list=null;
		try {
			list=dao.selectList("commaincate.listcommaincate",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}


	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("commaincate.dataCountCommaincate",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
