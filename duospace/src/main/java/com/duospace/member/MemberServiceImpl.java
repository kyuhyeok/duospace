package com.duospace.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duospace.member.memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public Member readMember(String userId) {
		Member dto =null;
		try {
			dto = dao.selectOne("member.readMember", userId);
			//회원정보 가져오기
			if(dto!=null) {
				
				if(dto.getPhone()!=null) {
					String [] s = dto.getPhone().split("-");
					dto.setPhone1(s[0]);
					dto.setPhone2(s[1]);
					dto.setPhone3(s[2]);
				}
			
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int insertMember(Member dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(Member dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLastLogin(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember2(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
