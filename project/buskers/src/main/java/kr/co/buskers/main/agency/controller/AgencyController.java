package kr.co.buskers.main.agency.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.buskers.common.page.AgencyPageResult;
import kr.co.buskers.main.agency.service.AgencyService;
import kr.co.buskers.repository.domain.AgencyGenre;
import kr.co.buskers.repository.domain.AgencyInfo;
import kr.co.buskers.repository.domain.AgencyPage;

@Controller("kr.co.buskers.main.agency.controller.AgencyController")
@RequestMapping("/main/board/agency")
public class AgencyController {
	
	@Autowired
	private AgencyService service;
	
	@RequestMapping("list.do")
	public void list(AgencyPage page, Model model) {
		model.addAttribute("list",service.agencyInfoList(page));
		model.addAttribute("pageResult", new AgencyPageResult(
				page.getPageNo(), service.agencyInfoCount()));
	}
	
	@RequestMapping("checkform.do")
	public void checkform() {}
	
	@RequestMapping("insertform.do")
	public void insertform() {}
	
	@RequestMapping("insert.do")
	public String insert(AgencyInfo agencyInfo,AgencyGenre agencyGenre,HttpSession session) {
//		agencyInfo.setMemberNo(session.getAttribute("user").getMemberNo());
//		System.out.println(agencyInfo.getMemberNo());
		System.out.println(agencyInfo.getAgencyName());
		System.out.println(agencyInfo.getEmail());
		System.out.println(agencyInfo.getPhone());
		System.out.println(agencyInfo.getPurpose());
		System.out.println(agencyInfo.getBasicAddr());
		System.out.println(agencyInfo.getDetailAddr());
		service.insertAgencyInfo(agencyInfo);
		System.out.println(agencyInfo.getAgencyInfoNo());
		agencyGenre.setAgencyInfoNo(agencyInfo.getAgencyInfoNo());
		for(String check : agencyGenre.getAgencyCheckbox()) {
			System.out.println(check);
		}
		service.insertAgencyGenre(agencyGenre);
		// agencyInfo insert 하기 + agency_genre insert 하기
		// service 구현하기 
		return "redirect:list.do";
	}
	
	@RequestMapping("jusopopup.do")
	public void jusopopup() {}
	
	
	
	
	
	
	
	
}
