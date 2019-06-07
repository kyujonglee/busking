
package kr.co.buskers.common.main.header.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.common.main.header.service.HeaderService;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Message;


@Controller
@RequestMapping("main/header/message")
public class HeaderController {
	
	@Autowired
	private HeaderService service;
	
	@RequestMapping("list.do")
	public void list(FreePage freePage, Model model, HttpSession session) {
		Map<String, Object> result = service.list(freePage, session);
		
		model.addAttribute("message", result.get("message"));
		model.addAttribute("sentMessage", result.get("sentMessage"));
	}
	
	@RequestMapping("write-form.do")
	public void writeForm() {}
	
	@RequestMapping("write.do")
	public String write(Message message) {
		service.write(message);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("delete-received.do")
	public String deleteMessage(int[] msgNo) {
		
		service.deleteMessage(msgNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("delete-sent.do")
	public String deleteSentMessage(int[] msgNo) {
		
		service.deleteSentMessage(msgNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do?active=sent_box";
	}
	
	@RequestMapping("message-count-ajax.do")
	@ResponseBody
	public int selectMessageCount(HttpSession session) {
		
		return service.selectMessageCount(session);
	}
	
	@RequestMapping("detail.do")
	public void detail(int msgNo, Model model) {
		
		Map<String, Object> result = service.detail(msgNo);
		
		model.addAttribute("message", result.get("message"));
		
	}
	@RequestMapping("receive-member-ajax.do")
	@ResponseBody
	public int selectMemberNickName(String nickName) {
		System.out.println(nickName);
		return service.selectMemberNickName(nickName);
	}
}
