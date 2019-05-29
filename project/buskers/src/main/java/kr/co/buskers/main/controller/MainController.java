package kr.co.buskers.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.buskers.main.controller.MainController")
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("main.do")
	public void main() {}
}
