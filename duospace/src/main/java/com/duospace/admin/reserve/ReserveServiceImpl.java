package com.duospace.admin.reserve;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("admin.reserveService")
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Reserve> reserveList(Map<String, Object> map) {
		List<Reserve> list=null;
		try {
			list=dao.selectList("admin.reserve.reserveRoomList", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("admin.reserve.dataCount", map);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public int delete(int rmresNum) throws Exception {
		int result=0;
		try {
			int reservNum= dao.selectOne("admin.reserve.readReservNum", rmresNum);
			result=dao.deleteData("admin.reserve.deleteRmres", rmresNum);
			dao.deleteData("admin.reserve.deleteReserv",reservNum);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public Reserve readPlacement(int floorNum) {
		Reserve dto = null;
		try {
			dto=dao.selectOne("admin.reserve.readPlacement", floorNum);
		} catch (Exception e) {
			e.toString();
		}
		return dto;
	}

	@Override
	public List<Reserve> checkInList(Map<String, Object> map) {
		List<Reserve> list =null;
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	

}
