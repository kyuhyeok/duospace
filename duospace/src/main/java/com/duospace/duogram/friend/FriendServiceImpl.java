package com.duospace.duogram.friend;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duogram.friendService")
public class FriendServiceImpl implements FriendService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Friend> listFriend(Map<String, Object> map) {
		List<Friend> list=null;
		
		try {
			list=dao.selectList("duoGramF.listFriend", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int fDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("duoGramF.fDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
}
