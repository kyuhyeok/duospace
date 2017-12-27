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
	public List<Reserve> checkInList() {
		List<Reserve> list =null;
		try {
			list = dao.selectList("admin.reserve.checkinList");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<Reserve> seatReserveList(Map<String, Object> map) {
		List<Reserve> list =null;
		try {
			list=dao.selectList("admin.reserve.seatReserveList", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public int dataCountComSeat(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("admin.reserve.dataCount_comSeat", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public List<Reserve> spotList() {
		List<Reserve> list =null;
		try {
			list=dao.selectList("admin.reserve.spotList");
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public List<Reserve> floorList(int spotCode) {
		List<Reserve> list =null;
		try {
			list=dao.selectList("admin.reserve.floorList",spotCode);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public List<Reserve> jinanRoomReserveList(Map<String, Object> map) {
		List<Reserve> list=null;
		try {
			list=dao.selectList("admin.reserve.jinanReserveRoomList", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public int jinanRoomdataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("admin.reserve.jinanRoomDataCount", map);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public int jinanSeatdataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("admin.reserve.jinanSeatDataCount", map);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public List<Reserve> jinanSeatReserveList(Map<String, Object> map) {
		List<Reserve> list=null;
		try {
			list=dao.selectList("admin.reserve.jinanSeatList", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public List<Reserve> seatReserveList_all(Map<String, Object> map) {
		List<Reserve> list =null;
		try {
			list=dao.selectList("admin.reserve.seatReserveList_all", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public int dataCountComSeat_all(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("admin.reserve.dataCount_comSeat_all", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	

}
