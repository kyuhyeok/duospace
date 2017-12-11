package com.duospace.admin.room;

import java.util.List;
import java.util.Map;

public interface RoomService {
	public int insertRoom(Room dto, String pathname);
	public int updateRoom(Room dto, String pathname);
	public int deleteRoom(int roomCode);
	public List<Room> listRoom(Map<String, Object> map);
	public Room readRoom (int roomCode);
	
}
