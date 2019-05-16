package kr.co.buskers.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("main.do")
	public void main() {}
}
