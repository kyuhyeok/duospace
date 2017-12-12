package com.duospace.admin.room;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.admin.floor.Floor;
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
				String saveFileName=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFileName(saveFileName);
			}
			result=dao.insertData("duospace.room.insert", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int updateRoom(Room dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
		
				if (newFilename != null) {
					// 이전 파일 지우기
					if(dto.getSaveFileName().length()!=0 && dto.getSaveFileName()!=null) {
						fileManager.doFileDelete(dto.getSaveFileName(), pathname);
					}
					dto.setSaveFileName(newFilename);
				}
			}
				
			dao.updateData("duospace.room.update", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteRoom(int roomCode) {
		int result=0;
		try {
			result=dao.deleteData("duospace.room.delete", roomCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Room> listRoom(Map<String, Object> map) {
		List<Room> list=null;
		try {
			list=dao.selectList("duospace.room.list", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Room readRoom(int roomCode) {
		Room dto=null;
		try {
			dto=dao.selectOne("duospace.room.readroom", roomCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duospace.room.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteListRoom(List<Integer> list) {
		int result=0;
		try {
			result=dao.deleteData("duospace.room.deleteList", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Room> flistRoom() {
		List<Room> flist=null;
		try {
			flist=dao.selectList("duospace.room.flist");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return flist;
	}

	@Override
	public List<Floor> listFloor(int spotCode) {
		List<Floor> list=null;
		try {
			list=dao.selectList("duospace.room.listFloor", spotCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	@Override
	public List<Room> slistRoom() {
		List<Room> slist=null;
		try {
			slist=dao.selectList("duospace.room.slist");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return slist;
	}

	@Override
	public List<Room> regionRoom() {
		List<Room> rlist=null;
		try {
			rlist=dao.selectList("duospace.room.region");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return rlist;
	}
	
}
