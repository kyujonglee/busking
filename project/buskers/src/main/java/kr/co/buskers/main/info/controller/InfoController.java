package kr.co.buskers.main.info.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.buskers.main.info.service.InfoService;

@Controller("kr.co.buskers.main.info.controller.InfoController")
@RequestMapping("main/info")
public class InfoController {
	
	@Autowired
	private InfoService service;
	
	@RequestMapping("info.do")
	public void info() {
		System.out.println("info method 통과!");
	}
}
