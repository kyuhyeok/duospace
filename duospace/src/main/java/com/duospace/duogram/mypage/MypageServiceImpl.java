package com.duospace.duogram.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.FileManager;
import com.duospace.common.dao.CommonDAO;
import com.duospace.member.Member;

@Service("duogram.mypageService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertAccept(int memberNum) {
		int result=0;
		try {
			result=dao.insertData("mypage.mypageInsertAccept", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countAccept(int memberNum) {
		int result=0;
		try {
			result=dao.selectOne("mypage.mypageCountAccept", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertBoard(Mypage dto, String pathname) {
		int result=0;
		try {
			if(! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			result=dao.insertData("mypage.mypageInsertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("mypage.mypageDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Mypage> listMypage(Map<String, Object> map) {
		List<Mypage> list=null;
		try {
			list=dao.selectList("mypage.mypageListBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int deleteBoard(int num, int memberNum, String pathname) {
		int result=0;
		try {
			
			Mypage dto=readBoard(num);
			if(dto!=null) {
				if(dto.getMemberNum()!=memberNum && memberNum!=1)
					return result;
				if(dto.getSaveFilename()!=null&&dto.getSaveFilename().length()!=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			
			dao.deleteData("mypage.deleteMypage", num);
			result=1;
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public Mypage readBoard(int num) {
		Mypage dto=null;
		
		try {
			dto=dao.selectOne("mypage.readBoard", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateBoard(Mypage dto, String pathname) {
		int result=0;
		
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
		
				if (newFilename != null) {
					// 이전 파일 지우기
					if(dto.getSaveFilename().length()!=0 && dto.getSaveFilename()!=null) {
						fileManager.doFileDelete(dto.getSaveFilename(), pathname);
					}
					dto.setSaveFilename(newFilename);
				}
			}
			dao.updateData("mypage.updateBoard", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReply(Reply dto) {
		int result=0;
		try {
			result=dao.insertData("mypage.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("mypage.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyCountAnswer(int answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("mypage.replyDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("mypage.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Member readMember(int memberNum) {
		Member dto =null;
		try {
			dto = dao.selectOne("mypage.readMember", memberNum);
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
	public int insertLikeBoard(Mypage dto) {
		int result=0;

		try{
			result=dao.insertData("mypage.insertLikeBoard", dto);
		} catch(Exception e) {
		}
		return result;
	}

	@Override
	public int countLikeBoard(int num) {
		int result=0;

		try{
			result=dao.selectOne("mypage.countLikeBoard", num);
		} catch(Exception e) {
		}
		return result;
	}
}
