package kr.co.buskers.main.agency.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main/board/agency")
public class AgencyController {
	
	@RequestMapping("agency_list.do")
	public void list() {
		
	}
}
