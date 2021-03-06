package com.duospace.admin.room;

import java.util.List;
import java.util.Map;

import com.duospace.admin.floor.Floor;

public interface RoomService {
	public int insertRoom(Room dto, String pathname);
	public int updateRoom(Room dto, String pathname);
	public int deleteRoom(int roomCode);
	public List<Room> listRoom(Map<String, Object> map);
	public Room readRoom (int roomCode);
	public int dataCount(Map<String, Object> map);
	public int deleteListRoom(List<Integer> list);
	public List<Room> slistRoom();
	public List<Room> flistRoom();
	public List<Floor> listFloor(int spotCode);
	public List<Room> regionRoom();
	public List<Room> rlistRoom(int spotCode);
	public List<Room> rlistRoom2(int roomCode);
}
