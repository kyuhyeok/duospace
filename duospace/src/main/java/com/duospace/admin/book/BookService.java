package com.duospace.admin.book;

import java.util.List;
import java.util.Map;

public interface BookService {
	
	public int insertBook(Book dto);
	public List<Book> listBook(Map<String, Object> map);
	public List<Bcategory> listBcategory();
	public int dataCount(Map<String, Object> map);

}
