package kr.co.buskers.main.socialmember.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.buskers.main.member.service.MemberService;
import kr.co.buskers.repository.domain.Member;

@Controller("kr.co.buskers.main.socialmember.controller.KakaoController")
@RequestMapping("main/member")
public class KakaoController {
	@Autowired
	private MemberService service;
	
	// 카카오 로그인 디비에 없을시에 회원가입 처리후 메인으로 이동
	@RequestMapping("social-signup.do")
	public String signupMember(HttpSession session, Member member,RedirectAttributes rttr) {
		System.out.println("소셜 사인업 들어옴");
		service.signupSocialMember(member);
		Member user = service.login(member);
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 60);   //물어보기
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("social-checkid.do")
	@ResponseBody
	public int checkId(Member member) {
		int result = 0;
        int user = service.checkId(member);
        if(user != 0) {
        	result = 1;
        }
        System.out.println("리턴하는값 "+result);
		return result;
	}
	

	
	// 로그인 처리
	@RequestMapping("social-login.do")
	public String login(HttpSession session, Member member,RedirectAttributes rttr) {
		Member user = service.login(member);
		user.setAccessToken(member.getAccessToken());
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 60);   //물어보기
		return "redirect:/index.jsp";
	}
	
	
}