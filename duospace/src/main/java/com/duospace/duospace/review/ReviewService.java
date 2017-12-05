package com.duospace.duospace.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	public int insertReview(Review dto, String pathname);
	public List<Review> listReview(Map<String, Object> map);
	public int dataCount(Map<String,Object> map);
	public Review readReview(int reservnum);
	public int updateHitCount(int reservnum);
	public int updateReview(Review dto, String pathname);
	public int deleteReview(int reservnum, String pathname, String userId);
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	
	
	
}
