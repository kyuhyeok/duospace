package com.duospace.admin.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.FileManager;
import com.duospace.common.dao.CommonDAO;


@Service("duospace.noticeService")
public class NoticeServiceImpl implements NoticeService  {

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertNotice(Notice dto, String pathname) {
		int result=0;
		try {
			
			if(! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			result=dao.insertData("duospace.notice.created", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Notice readNotice() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteListNotice() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Notice preReadNotice() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice nextReadNotice() {
		// TODO Auto-generated method stub
		return null;
	}

}
