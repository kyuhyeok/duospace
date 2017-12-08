package com.duospace.admin.floor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duospace.FloorService")
public class FloorServiceImpl implements FloorService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertFloor(Floor dto) {
		int result=0;
		try {
			result=dao.insertData("duospace.floor.insert", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateFloor(Floor dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFloor(int floorNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Floor> listSpot() {
		List<Floor> list=null;
		try {
			list=dao.selectList("duospace.floor.list");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Floor readFloor(int floorNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
