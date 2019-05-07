package kr.co.buskers.main.agency.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.buskers.main.agency.service.AgencyService;

@Controller("kr.co.buskers.main.agency.controller.AgencyController")
@RequestMapping("/main/board/agency")
public class AgencyController {
	
	@Autowired
	private AgencyService service;
	
	@RequestMapping("agency_list.do")
	public void list(Model model) {
		model.addAttribute("list",service.list());
	}
}
