package com.duospace.community.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("community.qnaController")
public class QnaController {
	@RequestMapping(value="/community/sub/qna", method=RequestMethod.GET)
	public String list() {

		return ".community.sub.qna";
}
}
