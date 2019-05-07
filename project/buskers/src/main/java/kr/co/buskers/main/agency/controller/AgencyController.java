package kr.co.buskers.main.agency.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.buskers.main.agency.service.AgencyService;


@Controller
@RequestMapping("main/board/agency")
public class AgencyController {
	
	@Autowired()
	private AgencyService service;
	
	@RequestMapping("agency_list.do")
//	public void list(Page page, Model model) {
	public void list(Model model) {
//		Map<String,Object> result = service.
//		model.addAttribute("list",result.get("list"));
//		model.addAttribute("pageResult", result.get("pageResult"));
	}
}
