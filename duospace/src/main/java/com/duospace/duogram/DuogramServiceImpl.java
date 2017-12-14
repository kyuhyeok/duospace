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
	public int insertAccept(int memberNum) {
		int result=0;
		try {
			result=dao.insertData("duogram.insertAccept", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countAccept(int memberNum) {
		int result=0;
		try {
			result=dao.selectOne("duogram.countAccept", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

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
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duogram.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Duogram> listDuogram(Map<String, Object> map) {
		List<Duogram> list=null;
		try {
			list=dao.selectList("duogram.listBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
