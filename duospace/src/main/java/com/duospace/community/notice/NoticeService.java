package com.duospace.community.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	
	public int insertNotice(Notice dto);
	public List<Notice> listNotice(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Notice readNotice(int noticenum);
	public int updateHitCount(int noticenum);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	public int updateNotice(Notice dto);
	public int deleteNotice(int noticenum);
}


