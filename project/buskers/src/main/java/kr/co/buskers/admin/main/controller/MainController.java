package kr.co.buskers.admin.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.buskers.admin.main.controller.MainController")
@RequestMapping("/admin/main")
public class MainController {
	@RequestMapping("main.do")
	public void main() {
		
	}
}
