package com.duospace.duogram.friend;

import java.util.List;
import java.util.Map;

public interface FriendService {
	public List<Friend> listPeople(Map<String, Object> map);
	public int pDataCount(Map<String, Object> map);
	public List<Friend> listFriend(Map<String, Object> map);
	public int fDataCount(Map<String, Object> map);
}
