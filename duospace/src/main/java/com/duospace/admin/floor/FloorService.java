package com.duospace.admin.floor;

import java.util.List;
import java.util.Map;

public interface FloorService {
	public int insertFloor(Floor dto);
	public int updateFloor(Floor dto);
	public int deleteFloor(int floorNum);
	public List<Floor> listSpot();
	public Floor readFloor(int floorNum);
}
