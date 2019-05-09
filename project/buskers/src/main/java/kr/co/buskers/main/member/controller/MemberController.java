package kr.co.buskers.main.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.main.member.service.MemberService;
import kr.co.buskers.main.member.util.SHA256Util;
import kr.co.buskers.repository.domain.Member;

@Controller
@RequestMapping("main/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 화면
	@RequestMapping("loginform.do")
	public void loginform() {}
	
	// 로그인 처리
	@RequestMapping("login.do")
	public ModelAndView login(HttpSession session, Member member) {
		ModelAndView mav = new ModelAndView();
		Member user = service.login(member);
		if(user == null) {
			mav.setViewName("redirect:loginform.do");
		} else {
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(10);
			
			mav.setViewName("redirect:/index.jsp");
		}
		return mav;
	}
	
	// 로그아웃 처리
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.jsp");
		return mav;
	}
	
	// 회원 가입 화면
	@RequestMapping("signupform.do")
	public void signupform() {}
	
	// 회원 가입 처리
	@RequestMapping("signup.do")
	public String signupMember(Member member) {
		String salt = SHA256Util.generateSalt();
		member.setPass(SHA256Util.getEncrypt(member.getPass(), salt));
		member.setSalt(salt);
		service.signupMember(member);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginform.do";
	}
	
	
	
	@RequestMapping("signupform-busker.do")
	public void list3() {
		
	}
	
	@RequestMapping("findIdform.do")
	public void list4() {
		
	}
	
	@RequestMapping("findPasswordform.do")
	public void list5() {
		
	}
	
}
