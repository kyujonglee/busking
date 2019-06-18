package kr.co.buskers.main.agency.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.buskers.common.page.AgencyPageResult;
import kr.co.buskers.main.agency.service.AgencyService;
import kr.co.buskers.main.member.service.MemberService;
import kr.co.buskers.repository.domain.AgencyGenre;
import kr.co.buskers.repository.domain.AgencyInfo;
import kr.co.buskers.repository.domain.AgencyPage;
import kr.co.buskers.repository.domain.Member;

@Controller("kr.co.buskers.main.agency.controller.AgencyController")
@RequestMapping("/main/board/agency")
public class AgencyController {
	
	@Autowired
	private AgencyService service;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("list.do")
	public void list(AgencyPage page, Model model) {
		if(page.getPageNo() == 0) {
			model.addAttribute("pageNo",1);
		}else {
			model.addAttribute("pageNo",page.getPageNo());
		}
		model.addAttribute("list",service.agencyInfoList(page));
		model.addAttribute("pageResult", new AgencyPageResult(
				page.getPageNo(), service.agencyInfoCount()));
	}
	
	@RequestMapping("checkform.do")
	public void checkform() {}
	
	@RequestMapping("insertform.do")
	public void insertform() {}
	
	@PostMapping("insert.do")
	public String insert(AgencyInfo agencyInfo,HttpSession session) throws Exception{
		Member mem = (Member)session.getAttribute("user");
//		// 자바스크립트에서 조건을 줄 것!
		agencyInfo.setMemberNo(mem.getMemberNo());
		service.insertAgencyInfo(agencyInfo);
		AgencyGenre agencyGenre = new AgencyGenre();
		agencyGenre.setAgencyInfoNo(agencyInfo.getAgencyInfoNo());
		agencyGenre.setAgencyCheckbox(agencyInfo.getAgencyCheckbox());
		service.insertAgencyGenre(agencyGenre);
		return "redirect:list.do";
	}
	
	@RequestMapping("detail.do")
	public void detail(int agencyInfoNo,int pageNo,Model model) {
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("agencyInfo",service.selectAgencyInfoByNo(agencyInfoNo));
	}
	
	@RequestMapping("delete.do")
	public String delete(int agencyInfoNo) {
		service.deleteAgencyInfoAll(agencyInfoNo);
		return "redirect:list.do";
	}
	
	@RequestMapping("update.do")
	public ModelAndView update(AgencyInfo agencyInfo,int pageNo,int agencyInfoNo) {
		System.out.println(agencyInfo.getAgencyCheckbox());
		System.out.println(agencyInfo.getAgencyCheckbox().get(0));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("agencyInfoNo",agencyInfoNo);
		mav.addObject("pageNo",pageNo);
		mav.setViewName("redirect:detail.do");
		
		AgencyGenre agencyGenre = new AgencyGenre();
		agencyGenre.setAgencyInfoNo(agencyInfo.getAgencyInfoNo());
		agencyGenre.setAgencyCheckbox(agencyInfo.getAgencyCheckbox());
		service.updateAgencyInfo(agencyInfo,agencyGenre);
		
		return mav;
	}
	
	@RequestMapping("updateform.do")
	public void updateform(int agencyInfoNo,int pageNo, Model model) {
		model.addAttribute("agencyInfo",service.selectAgencyInfoByNo(agencyInfoNo));
		model.addAttribute("genre",service.selectGenre());
		model.addAttribute("pageNo",pageNo);
	}
	
	@RequestMapping("update-agency-permission-ajax.do")
	@ResponseBody
	public void updateAgencyPermission(AgencyInfo agencyInfo) {
		service.updateAgencyPermission(agencyInfo);
	}
	
	@RequestMapping("check-agencyCode-ajax.do")
	@ResponseBody
	public int checkAgencyCode(String agencyCode) {
		return service.checkAgencyCode(agencyCode);
	}
	
	@RequestMapping("insert-memberAgency-ajax.do")
	@ResponseBody
	public void insertMemberAgency(AgencyInfo agencyInfo, HttpSession session) {
		service.insertMemberAgency(agencyInfo);
		session.removeAttribute("user");
		Member user = mService.selectMember(agencyInfo.getMemberNo());
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 60);
	}
	
}
