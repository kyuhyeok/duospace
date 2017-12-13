package com.duospace.duogram.socket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("socket.socketController")
public class SocketController {

	@RequestMapping(value="/duogram/socket")
	public String main() {
		return "duoGram/socket";
	}
}
