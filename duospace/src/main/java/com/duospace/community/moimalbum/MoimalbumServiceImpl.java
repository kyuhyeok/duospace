package com.duospace.community.moimalbum;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.FileManager;
import com.duospace.common.dao.CommonDAO;

@Service("moimalbum.moimalbumServiceImpl")
public class MoimalbumServiceImpl implements MoimalbumService{

	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertMoimalbum(Moimalbum dto, String path) {
		int result=0;
		
		try {
			if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()) {
				String newFilename=fileManager.doFileUpload(dto.getUpload(), path);
				dto.setImageFile(newFilename);
				result=dao.insertData("moimalbum.insertMoimalbum", dto);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moimalbum.dataCount", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Moimalbum> listMoimalbum(Map<String, Object> map) {
		List<Moimalbum> list=null;
		
		try {
			list=dao.selectList("moimalbum.listMoimalbum", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public Moimalbum readMoimalbum(int alnum) {
		Moimalbum dto=null;
		
		try {
			dto=dao.selectOne("moimalbum.readMoimalbum", alnum);
			
		} catch (Exception e) {
		}
		
		return dto;
	}
	
	@Override
	public Moimalbum preReadMoimalbum(Map<String, Object> map) {
	Moimalbum dto=null;
		
		try {
			dto=dao.selectOne("moimalbum.preReadMoimalbum", map);
		} catch (Exception e) {
		}
		
		return dto;
	}

	@Override
	public Moimalbum nextReadMoimalbum(Map<String, Object> map) {
		Moimalbum dto=null;
		
		try {
			dto=dao.selectOne("moimalbum.nextReadMoimalbum", map);
			
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public int updateMoimalbum(Moimalbum dto, String path) {
		int result=0;
		
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), path);
				
				if (newFilename != null) {
					
					Moimalbum vo = readMoimalbum(dto.getAlnum());
					if(vo!=null && vo.getImageFile()!=null) {
						fileManager.doFileDelete(vo.getImageFile(), path);
					}
					
					dto.setImageFile(newFilename);
				}
			}
			
			result=dao.updateData("moimalbum.updateMoimalbum", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int deleteMoimalbum(int alnum, String imageFile, String path) {
		int result=0;
		
		try {
			if(imageFile!=null)
				fileManager.doFileDelete(imageFile, path);
			
			result=dao.deleteData("moimalbum.deleteMoimalbum", alnum);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int insertLikeMoimalbum(Moimalbum dto) {
		int result=0;
		
		try {
			result=dao.insertData("moimalbum.insertLikeMoimalbum", dto);
		}catch(Exception e) {
			
		}
		return result;
	}

	@Override
	public int countLikeMoimalbum(int alnum) {
		int result=0;
		
		try {
			result=dao.selectOne("moimalbum.countLikeMoimalbum", alnum);
			
		}catch(Exception e) {
			
		}
		
		return result;
	}
		
	
}
