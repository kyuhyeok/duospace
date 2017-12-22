package com.duospace.community.moimcalendar;

import java.util.List;
import java.util.Map;

public interface MoimCalendarService {
	public int insertMoimCalendar(MoimCalendar dto);
	public List<MoimCalendar> listMoimCalendar(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
