package com.duospace.community.commoim;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Commoim> listCommoim(Map<String, Object> map) {
		List<Commoim> list=null;
		try {
			list=dao.selectList("commoim.listCommoim",map);//mapper주소...
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertAccept(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("commoim.insertAccept",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countAccept(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("commoim.countAccept",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	

}
