package kr.co.buskers.main.socialmember.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	private String prevUrl;
	
	// 카카오 로그인 디비에 없을시에 회원가입 처리후 메인으로 이동
	@RequestMapping("social-signup.do")
	public String signupMember(HttpSession session, Member member,RedirectAttributes rttr) {
//		System.out.println(member.getId());
//		System.out.println(member.getName());
//		System.out.println(member.getNickName());
//		System.out.println(member.getMemberType());
		//member에 닉네임이 있음
//		Member mem = (Member)session.getAttribute("user");
		//member에 아이디 설정
//		member.setId(mem.getId());
		service.signupSocialMember(member);
//		//유저업데이트
//		service.updateNickNameSocialMember(member);
		//기존세션제거
//		session.removeAttribute("user");
		//업데이트한 유저객체 받아옴
		Member user = service.login(member);
		
		//세션에다시올려줌
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 60);   
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
		return result;
	}
	

	
	// 로그인 처리
	@RequestMapping("social-login.do")
	public String login(HttpSession session, Member member,RedirectAttributes rttr) {
		
		Member user = service.login(member);
		user.setAccessToken(member.getAccessToken());
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 60);  
		return "redirect:/index.jsp";
	}
	
	// 소셜 로그인 폼
	@RequestMapping("signupform-social.do")
	public void signupform(HttpSession session, Member member,RedirectAttributes rttr,Model model) {
		try {
			model.addAttribute("id",member.getId());
			model.addAttribute("memberType",member.getMemberType());
		}catch(Exception e) {
		}
	}
}