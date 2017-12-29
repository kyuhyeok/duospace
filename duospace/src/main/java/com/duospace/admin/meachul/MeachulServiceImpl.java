package com.duospace.admin.meachul;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("admin.meachulService")
public class MeachulServiceImpl implements MeachulService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Meachul> mechulList(Map<String, Object> map) {
		List<Meachul> list=null;
		try {
			list=dao.selectList("admin.meachul.list", map);
		} catch (Exception e) {
			e.toString();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("admin.meachul.dataCount", map);
		} catch (Exception e) {
			e.toString();
		}
		
		return result;
	}

}
