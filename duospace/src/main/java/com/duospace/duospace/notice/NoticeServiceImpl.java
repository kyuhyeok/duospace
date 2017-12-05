package com.duospace.duospace.notice;

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
		List<Notice> list=null;
		
		try {
			list=dao.selectList("duospace.notice.list", map);
		} catch (Exception e) {
			e.toString();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duospace.notice.dataCount", map);
			
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public Notice readNotice(int num) {
		Notice dto = null;
		try {
			dto=dao.selectOne("duospace.notice.readNotice", num);
		} catch (Exception e) {
			e.toString();
		}
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		try {
			result=dao.updateData("duospace.notice.updateHitCount", num);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}
	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto = null;
		try {
			dto=dao.selectOne("duospace.notice.preDto", map);
		} catch (Exception e) {
			e.toString();
		}
		return dto;
	}
	
	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto = null;
		try {
			dto=dao.selectOne("duospace.notice.nextDto", map);
		} catch (Exception e) {
			e.toString();
		}
		return dto;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) {
		int result=0;
		try {
			dao.updateData("duospace.notice.updateNotice", dto);
		} catch (Exception e) {
			e.toString();
		}
		return result;
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
	public List<Notice> listNoticeTop() {
		List<Notice> list=null;
		
		try {
			list=dao.selectList("duospace.notice.listNotice");
		} catch (Exception e) {
			e.toString();
		}
		
		return list;
	}

}
