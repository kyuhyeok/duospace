package com.duospace.community.meeting;

import java.util.List;
import java.util.Map;

public interface MeetingService {
	public int insertMeeting(Meeting dto,String pathname);
	public List<Meeting> listMeeting(Map<String, Object>map);
	public int dataCount(Map<String, Object>map);
	public Meeting readMeeting(int num);
	public int updateHitCount(int num);
	public int updateMeeting(Meeting dto,String pathname);
	public int deleteMeeting(int num,String pathname);
	
}
