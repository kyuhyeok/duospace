package com.duospace.duospace.book;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("duospace.bookController")
public class BookController {
	
	@RequestMapping(value="/book")
	public String reserve(Model model) throws Exception {
		return ".book.book";
	}
}
