package com.test.tst;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.buskers.main.member.service.MemberService;
import kr.co.buskers.repository.domain.Member;

@Controller
@RequestMapping("main/member")
public class NaverController {
	@Autowired
	private MemberService service;

	/* NaverLoginBO */ 
	private NaverLoginBO naverLoginBO; 
	private String apiResult = null; 
	
	@Autowired private void setNaverLoginBO(NaverLoginBO naverLoginBO) { 
		this.naverLoginBO = naverLoginBO; 
	}

	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */ 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session); 
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125 
		System.out.println("네이버:" + naverAuthUrl); 
		//네이버 model.addAttribute("url", naverAuthUrl); 
		return "login"; 
	}

	
	

	
	// 로그인 처리
		@RequestMapping("naver-login.do")
		public String login(HttpSession session, Member member,RedirectAttributes rttr) {
			Member user = service.login(member);
			user.setAccessToken(member.getAccessToken());
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(60 * 60);   //물어보기
			return "redirect:/index.jsp";
		}
	

}