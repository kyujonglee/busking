package kr.co.buskers.common.main.header.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.common.main.header.service.HeaderService;
import kr.co.buskers.repository.domain.Message;


@Controller
@RequestMapping("main/header/message")
public class HeaderController {
	
	@Autowired
	private HeaderService service;
	
	@RequestMapping("list.do")
	public void list() {}
	
	@RequestMapping("write-form.do")
	public void writeForm() {}
	
	@RequestMapping("write.do")
	public String write(Message message) {
		service.write(message);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
}
