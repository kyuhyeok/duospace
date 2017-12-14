package com.duospace.community.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("community.communityService")
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int insertCommunity(Community dto) {
		int result=0;
		try {
			result=dao.insertData("community.insertCommunity",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("community.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public List<Community> listCommunity(Map<String, Object> map) {
		List<Community> list =null;
		try {
			list=dao.selectList("community.listCommunity",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}


	@Override
	public Community readBoard(int num) {
		Community dto = null;
		try {
			dto=dao.selectOne("community.readCommunity",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}


	@Override
	public int updateHitCount(int num) {
		int result=0;
		try {
			result=dao.updateData("community.updateHitCount",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public int updateCommunity(Community dto) {
		int result =0;
		try {
			result=dao.updateData("community.updateCommunity",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public int deleteCommunity(int num ,String userId) {
		int result=0;
		try {
			result = dao.deleteData("community.deleteCommunity",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public Community preReadBoard(Map<String, Object> map) {
		Community dto=null;
		try {
			dto=dao.selectOne("community.preReadBoard",map);
		} catch (Exception e) {
			System.out.println(e.toString());
			
		}
		return dto;
	}


	@Override
	public Community nextReadBoard(Map<String, Object> map) {
		Community dto=null;
		try {
			dto=dao.selectOne("community.nextReadBoard",map);
		} catch (Exception e) {
			System.out.println(e.toString());
			
		}
		return dto;
	}

}
