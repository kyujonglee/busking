package kr.co.buskers.main.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.main.member.service.MemberService;
import kr.co.buskers.repository.domain.Member;

@Controller
@RequestMapping("main/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// 로그인 화면
	@RequestMapping("loginform.do")
	public void loginform() {}
	
	// 로그인 처리
	@RequestMapping("login.do")
	public String login(HttpSession session, Member member,RedirectAttributes rttr) {
		Member user = service.login(member);
		
		// DB 값 체크
		if(user != null) {
			boolean passMatch = passEncoder.matches(member.getPass(), user.getPass());
			// passMatch 를 통과 true 값일때
			if(passMatch) {
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(60 * 60);
				return "redirect:/index.jsp";
			} 
			// DB 가데이터 로그인 체크용
			else if(user.getIsAdmin() == 'y' && user.getPass().equals(member.getPass())) {
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(60 * 60);
				return "redirect:/index.jsp";
			} 
			// passMatch 통과 실패 false 값일때
			else {
				rttr.addFlashAttribute("msg", "msgPass");
				return "redirect:loginform.do";
			}
		} 
		// DB내의 id값과 로그인폼에 입력한 id 값이 일치하는것이 없을때
		else {
			rttr.addFlashAttribute("msg", "msgId");
			return "redirect:loginform.do";
		}
	}
	
	// 로그인 세션이 없을때 처리
	@RequestMapping("needlogin.do")
	public ModelAndView needlogin() {
		ModelAndView mav = new ModelAndView("/main/member/needLogin");
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
		
		String inputPass = member.getPass();
		String pass = passEncoder.encode(inputPass);
		member.setPass(pass);

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
