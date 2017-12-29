package com.duospace.admin.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("admin.member.memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Member> memberList(Map<String, Object> map) {
		List<Member> list=null;
		try {
			list=dao.selectList("admin.member.memberList", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public int memberDelete(int memberNum) {
		int result=0;
		try {
			result=dao.updateData("admin.member.deleteMember", memberNum);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("admin.member.dataCount", map);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

}
