package com.duospace.admin.room;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.FileManager;
import com.duospace.common.dao.CommonDAO;

@Service("duospace.RoomService")
public class RoomServiceImpl implements RoomService{

	@Autowired 
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertRoom(Room dto, String pathname) {
		int result=0;
		try {
			if(! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
			}
			result=dao.insertData("duospace.room.insert", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int updateRoom(Room dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRoom(int roomCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Room> listRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Room readRoom(int roomCode) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
