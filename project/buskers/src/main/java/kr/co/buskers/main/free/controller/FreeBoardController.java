package kr.co.buskers.main.free.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.buskers.main.free.service.FreeService;
import kr.co.buskers.repository.domain.FreePage;

@Controller
@RequestMapping("main/board/free")
public class FreeBoardController {
	
	@Autowired
	private FreeService service;
	
	@RequestMapping("list.do")
	public void list(FreePage freePage, Model model) {
		Map<String, Object> result = service.list(freePage);
		
		model.addAttribute("notifyList", result.get("notifyList"));
		model.addAttribute("list", result.get("list"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	
	@RequestMapping("list-ajax.do")
	@ResponseBody
	public Map<String, Object> sortList(HttpServletRequest request, FreePage freePage) {
		Map<String, Object> result = service.sortList(request, freePage);
		
		return result;
	}
	
	@RequestMapping("detail.do")
	public void detail(int boardNo, Model model) {
		model.addAttribute("board", service.detail(boardNo));
	}
}
