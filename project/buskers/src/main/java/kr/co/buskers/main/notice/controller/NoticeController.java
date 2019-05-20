package kr.co.buskers.main.notice.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.main.notice.service.NoticeService;
import kr.co.buskers.repository.domain.NoticePage;

@Controller("kr.co.buskers.main.notice.controller.NoticeController")
@RequestMapping("/main/board/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;	
	
	@RequestMapping("list.do")
	public void list(Model model,NoticePage noticePage) {
		Map<String, Object> result = service.list(noticePage);
		model.addAttribute("list",result.get("list"));
	}
	
	@RequestMapping("list-ajax.do")
	@ResponseBody
	public Map<String, Object> listAjax(Model model,NoticePage noticePage) {
		Map<String, Object> result = service.listAjax(noticePage);
		
		return result;
	}
	
	@RequestMapping("detail-ajax.do")
	@ResponseBody
	public Map<String,Object> detail(int boardNo, Model model) {
		Map<String, Object> result = service.detail(boardNo);
		return result;
	}
}
