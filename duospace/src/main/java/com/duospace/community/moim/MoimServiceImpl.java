package com.duospace.community.moim;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("moim.moimService")
public class MoimServiceImpl implements MoimService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertMoim(Moim dto) {
		int result=0;
		try {
			result=dao.insertData("moim.insertMoim",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Moim> listMoim(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Moim readMoim(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateMoim(Moim dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMoim(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAccept(int memberNum) {
		int result=0;
		try {
			result=dao.insertData("commoim.insertAccept",memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countAccept(int memberNum) {
		int result=0;
		try {
			result=dao.selectOne("commoim.countAccept",memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
