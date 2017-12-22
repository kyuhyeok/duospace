package com.duospace.admin.book;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.FileManager;
import com.duospace.common.dao.CommonDAO;

@Service("duospace.bookService")
public class BookServiceImpl implements BookService{

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertBook(Book dto) {
		int result=0;
		
		try {
			result=dao.insertData("duospace.book.insert", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Book> listBook(Map<String, Object> map) {
		List<Book> list=null;
		
		try {
			list=dao.selectList("duospace.book.listBook", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duospace.book.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Bcategory> listBcategory() {
		List<Bcategory> list=null;
		
		try {
			list=dao.selectList("duospace.book.listBcategory");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

}
