package com.duospace.duospace.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public int insertNotice(Notice dto,String pathname);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	public int dataCount(Map<String, Object> map);
	public Notice readNotice(int num);
	public int updateHitCount(int num);
	public int updateNotice(Notice dto,String pathname);
	public int deleteNotice(int num);
	public int deleteListNotice(List<Integer> list);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	
	
}
