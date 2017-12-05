package com.duospace.duospace.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.FileManager;
import com.duospace.common.dao.CommonDAO;

@Service("duospace.reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertReview(Review dto, String pathname) {
		int result=0;
		try {
			
			if(! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
			}
			
			result=dao.insertData("duospace.review.created", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Review readReview(int reservnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int reservnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(Review dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int reservnum, String pathname, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReply(Reply dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
}
