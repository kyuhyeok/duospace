package com.duospace.community.community;

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

}
