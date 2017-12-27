package com.duospace.duospace.epilogue;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.FileManager;
import com.duospace.common.dao.CommonDAO;

@Service("duospace.epilogueService")
public class epilogueServiceImpl implements epilogueService{
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertReview(epilogue dto, String pathname) {
		int result=0;
		try {
			
			if(! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
			}
			
			result=dao.insertData("duospace.epilogue.insert", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<epilogue> listReview(Map<String, Object> map) {
		List<epilogue> list=null;
		try {
			list=dao.selectList("duospace.epilogue.eplist", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount() {
		int result=0;
		try {
			result=dao.selectOne("duospace.epilogue.dataCount");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public epilogue readReview(int reservnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int reservnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(epilogue dto, String pathname) {
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
