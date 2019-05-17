package kr.co.buskers.main.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.buskers.main.notice.controller.NoticeController")
@RequestMapping("/main/board/notice")
public class NoticeController {

	@RequestMapping("/list.do")
	public void list() {}
}
