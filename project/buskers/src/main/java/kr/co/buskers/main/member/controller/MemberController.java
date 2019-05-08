package kr.co.buskers.main.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.main.member.service.MemberService;
import kr.co.buskers.repository.domain.Member;

@Controller
@RequestMapping("main/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	
	@RequestMapping("loginform.do")
	public void loginform() {}
	
	@RequestMapping("signupform.do")
	public void signupform() {}
	
	@RequestMapping("signup.do")
	public String signup(Member member) {
		System.out.println(member.getId());
		System.out.println(member.getNickName());
		System.out.println(member.getPass());
		String salt = SHA256Util.generateSalt();
		member.setPass(SHA256Util.getEncrypt(member.getPass(), salt));
		member.setSalt(salt);
		System.out.println(member.getPass());
		System.out.println(member.getSalt());
		service.signup(member);
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
