package com.duospace.community.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("community.noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertNotice(Notice dto) {
		int result=0;
		
		try {
			result=dao.insertData("community.notice.created", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list=null;
		
		try {
			list=dao.selectList("community.notice.listNotice", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("community.dataCount", map);
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public Notice readNotice(int noticenum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int noticenum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateNotice(Notice dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int noticenum) {
		// TODO Auto-generated method stub
		return 0;
	}
}
	