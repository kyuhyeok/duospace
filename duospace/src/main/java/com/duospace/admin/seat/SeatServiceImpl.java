package com.duospace.admin.seat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("admin.seatService")
public class SeatServiceImpl implements SeatService{

	@Autowired
	CommonDAO dao;
	
	@Override
	public List<Seat> listSpot() {
		List<Seat> list=null;
		try {
			list=dao.selectList("duospace.seat.spot_list");

		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duospace.seat.dataCount", map);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}
	
	@Override
	public List<Seat> listPlacement(Map<String, Object> map) {
		List<Seat> list=null;
		try {
			list=dao.selectList("duospace.seat.placementList", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	
	
	
	@Override
	public List<Seat> listFloor(int spotCode) {
		List<Seat> fList=null;
		try {
			fList=dao.selectList("duospace.seat.floorList", spotCode);
		} catch (Exception e) {
			e.toString();
		}
		
		return fList;
	}

	@Override
	public int insertPlacement(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("duospace.seat.insertPlacement", map);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public int insertSeats() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Seat readPlacement() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePlacement() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePlacement() {
		// TODO Auto-generated method stub
		return 0;
	}


	

	

}
