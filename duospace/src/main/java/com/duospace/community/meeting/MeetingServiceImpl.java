package com.duospace.community.meeting;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("meeting.meetingService")
public class MeetingServiceImpl implements MeetingService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int insertMeeting(Meeting dto) {
		int result=0;
		try {
			result=dao.insertData("meeting.insertMeeting",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Meeting> listMeeting(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Meeting readMeeting(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateMeeting(Meeting dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMeeting(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}
