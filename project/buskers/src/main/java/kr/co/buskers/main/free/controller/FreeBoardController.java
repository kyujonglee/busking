package kr.co.buskers.main.free.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.buskers.main.free.service.FreeService;
<<<<<<< HEAD
=======
import kr.co.buskers.repository.domain.FreePage;
>>>>>>> master

@Controller
@RequestMapping("main/board/free")
public class FreeBoardController {
	
	@Autowired
	private FreeService service;
	
<<<<<<< HEAD
//	@RequestMapping("list.do")
//	public void list(Page page, Model model) {
//		Map<String, Object> result = service.list(page);
//
//		// model에 추가될 데이터 처리
//		model.addAttribute("list", result.get("list"));
//		model.addAttribute("pageResult", result.get("pageResult"));
//	}
=======
	@RequestMapping("list.do")
	public void list(FreePage freePage, Model model) {
	}

>>>>>>> master
}
