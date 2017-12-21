package com.duospace.community.moimcalendar;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("calendar.CalendarService")
public class MoimCalendarServiceImpl implements MoimCalendarService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertMoimCalendar(MoimCalendar dto) {
		int result=0;
		try {
			result=dao.insertData("moimCalendar.insertMoimCalendar",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<MoimCalendar> listMoimCalendar(Map<String, Object> map) {
		List<MoimCalendar> list = null;
		try {
			list=dao.selectList("moimCalendar.listMoimCalendar", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("moimCalendar.dataCountMoimCalendar", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
