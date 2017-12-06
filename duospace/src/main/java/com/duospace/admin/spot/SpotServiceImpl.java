package com.duospace.admin.spot;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duospace.spotService")
public class SpotServiceImpl implements SpotService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertSpot(Spot dto) {
		int result=0;
		try {
			result=dao.insertData("duospace.spot.insert", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Spot> listSpot(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Spot readSpot(int spotCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateSpot(Spot dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSpot(int spotCode) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
