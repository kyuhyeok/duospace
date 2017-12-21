package com.duospace.duospace.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;
import com.duospace.member.Member;

@Service(value="duospace.mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	public CommonDAO dao;
	
	@Override
	public List<Mypage> myList(int memberNum) {
		List<Mypage> list=null;
		try {
			list=dao.selectList("duospace.mypage.paylist", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
