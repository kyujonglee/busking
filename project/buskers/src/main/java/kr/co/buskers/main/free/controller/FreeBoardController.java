package kr.co.buskers.main.free.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.main.free.service.FreeService;
import kr.co.buskers.repository.domain.FreeBoard;
import kr.co.buskers.repository.domain.FreeBoardComment;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Member;

@Controller
@RequestMapping("main/board/free")
public class FreeBoardController {
	
	@Autowired
	private FreeService service;
	
	@RequestMapping("list.do")
	public void list(FreePage freePage, Model model, HttpSession session) {
		Map<String, Object> result = service.list(freePage);
		System.out.println(result.get("searchType"));
		model.addAttribute("searchType", result.get("searchType"));
		model.addAttribute("input", result.get("input"));
		model.addAttribute("sortType", result.get("sortType"));
		model.addAttribute("notifyList", result.get("notifyList"));
		model.addAttribute("list", result.get("list"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	
	@RequestMapping("list-ajax.do")
	@ResponseBody
	public Map<String, Object> sortList(FreePage freePage) {
		Map<String, Object> result = service.sortList(freePage);
		
		return result;
	}
	
	@RequestMapping("comment-ajax.do")
	@ResponseBody
	public Map<String, Object> insertComment(FreeBoardComment freeBoardComment, Model model) {
		Map<String, Object> result = service.insertComment(freeBoardComment);
		
		model.addAttribute("comment", result.get("comment"));
		
		return result;
	}
	
	@RequestMapping("detail.do")
	public void detail(int boardNo, Model model, HttpSession session) {
		
		Map<String, Object> result = service.detail(boardNo, session);
		
		if (session.getAttribute("user") != null) {
			model.addAttribute("like", result.get("like"));
		}
		model.addAttribute("comment", result.get("comment"));
		model.addAttribute("board", result.get("board"));
	}
	
	@RequestMapping("write-form.do")
	public void writeForm() {
		
	}
	
	@RequestMapping("/write.do")
	public String write(FreeBoard freeBoard) {
		service.write(freeBoard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
}
