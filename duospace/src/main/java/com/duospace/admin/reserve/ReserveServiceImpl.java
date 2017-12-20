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

	

}
