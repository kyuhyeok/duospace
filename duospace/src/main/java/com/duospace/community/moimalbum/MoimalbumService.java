package com.duospace.community.moimalbum;

import java.util.List;
import java.util.Map;


public interface MoimalbumService {

	public int insertMoimalbum(Moimalbum dto, String path);
	public int dataCount(Map<String, Object> map);
	public List<Moimalbum> listMoimalbum(Map<String, Object> map);
	public Moimalbum readMoimalbum(int membernum);
	
	public Moimalbum preReadMoimalbum(Map<String, Object> map);
	public Moimalbum nextReadMoimalbum(Map<String, Object> map);
	public int updateMoimalbum(Moimalbum dto, String path);
	public int deleteMoimalbum(int num, String imageFilename, String path);
	
	public int insertLikeMoimalbum(Moimalbum dto);
	public int countLikeMoimalbum(int alnum);
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	
}
