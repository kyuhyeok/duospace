package com.duospace.admin.member;

import java.util.List;
import java.util.Map;

public interface MemberService {

	public List<Member> memberList(Map<String,Object> map);
	public int dataCount(Map<String,Object> map);
	public int memberDelete(int memberNum);
}
