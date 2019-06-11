package kr.co.buskers.main.member.controller;

import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.buskers.common.file.service.FileService;
import kr.co.buskers.main.member.service.MemberService;
import kr.co.buskers.main.member.util.Email;
import kr.co.buskers.main.member.util.EmailSender;
import kr.co.buskers.main.socialmember.controller.KakaoApi;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.BuskerGenre;
import kr.co.buskers.repository.domain.Member;

@Controller
@RequestMapping("main/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private FileService fService;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email email;
	
	@Autowired 
	private KakaoApi kka;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// 로그인 화면
	@RequestMapping("loginform.do")
	public String loginform(HttpSession session) {
		if(session.getAttribute("user") != null) {
			return "redirect:/index.jsp";
		}
		return "main/member/loginform";
	}
	
	// 로그인 처리
	@RequestMapping("login.do")
	public String login(HttpSession session, Member member, RedirectAttributes rttr) {
		
		
		
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
			// DB 가데이터(관리자) 로그인 체크용
			else if(user.getIsAdmin().equals("y") && user.getPass().equals(member.getPass())) {
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(60 * 60);
				return "redirect:/index.jsp";
			} 
			// DB 가데이터(버스커) 로그인 체크용
			else if(user.getIsBusker().equals("y") && user.getPass().equals(member.getPass())) {
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
		Member mem = (Member)session.getAttribute("user");
		try {
			kka.kakaoLogout(mem.getAccessToken());
		}catch(Exception e) {
			
		}
		session.removeAttribute("user");
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
	
	// 아이디 중복 체크
	@RequestMapping("checkId.do")
	@ResponseBody
	public int checkId(String id) {
		int result = 0;
		Member member = new Member();
		member.setId(id);
        int user = service.checkId(member);
        if(user != 0) {
        	result = 1;
        }
		return result;
	}
	
	// 이메일 중복 체크
	@RequestMapping("checkEmail.do")
	@ResponseBody
	public int checkEmail(String email) {
		int result = 0;
		Member member = new Member();
		member.setEmail(email);
        int user = service.checkEmail(member);
        if(user != 0) {
        	result = 1;
        }
		return result;
	}
	
	// 닉네임 중복 체크
	@RequestMapping("checkNickName.do")
	@ResponseBody
	public int checkNickName(String nickName) {
		int result = 0;
		Member member = new Member();
		member.setNickName(nickName);
        int user = service.checkNickName(member);
        if(user != 0) {
        	result = 1;
        }
		return result;
	}
	
	// 아이디 찾기 폼 이동
	@RequestMapping("findIdform.do")
	public void findIdform() {}
	
	// 아이디 찾기
	@RequestMapping("findId.do")
	public String findId(Member member, RedirectAttributes rttr) {
		Member user = service.findId(member);
		if (user != null) {
			String id = user.getId();
			StringBuffer sb = new StringBuffer(id);
			
			String sbId = sb.replace(id.length()-3, id.length()-1, "**").toString();
			rttr.addFlashAttribute("sbId", sbId);
			return "redirect:findIdResult.do";
		} else {
			rttr.addFlashAttribute("msg", "msgEmail");
			return "redirect:findIdform.do";
		}
	}
	
	// 아이디찾기 결과 폼
	@RequestMapping("findIdResult.do")
	public void findIdResult() {
		
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping("findPasswordform.do")
	public void findPasswordform() {}
		
	// 비밀번호 찾기 및 새로운 비밀번호 생성
	@RequestMapping("findPass.do")
	public String newPassword(Member member, RedirectAttributes rttr) throws Exception {
		Member user = service.findPass(member);
		
		if(user != null) {
			// 임시비밀번호 발급
			Random r = new Random();
			int num = r.nextInt(89999) + 10000;
			String npassword = "bapsi" + Integer.toString(num);
			
			// 스프링 시큐리티 암호화
			String pass = passEncoder.encode(npassword);
			member.setPass(pass);
			
			// DB에 업데이트해줌
			service.newPass(member);
			
			
			email.setContent("새로운 비밀번호는 " + npassword + " 입니다.");
			email.setReceiver(member.getEmail());
			email.setSubject("안녕하세요" + member.getId() + "님! 재설정된 비밀번호 입니다!");
			
			// 멀티 쓰레드 사용
			ExecutorService executor = Executors.newWorkStealingPool();
			executor.execute(() -> {
				try {
					emailSender.SendEmail(email);
				} catch (Exception e) {
					e.printStackTrace();
				}
			});
			
			
			String email = member.getEmail();
			StringBuffer sb = new StringBuffer(email);
			
			String sbEmail = sb.replace(2, 4, "**").toString();
			
			rttr.addFlashAttribute("sbEmail", sbEmail);
			return "redirect:findPasswordResult.do";
		} else {
			rttr.addFlashAttribute("msg", "msgFalse");
			return "redirect:findPasswordform.do";
		}
	}

	// 비밀번호 찾기 결과창
	@RequestMapping("findPasswordResult.do")
	public void findPasswordResult() {
		
	}
	
	// 개인설정 페이지
	@RequestMapping("setting.do")
	public void setting() {
		
	}
	
	// 프로필 이미지 업로드
	@RequestMapping("profileUpload.do")
	@ResponseBody
	public void profileUpload(MultipartFile file, String uriPath, Member member, HttpSession session) throws Exception {
		System.out.println(member.getId());
		System.out.println(member.getMemberNo());
		System.out.println(member.getProfileImg());
		// 프로필 이미지가 이미 존재한다면
//		if(member.getProfileImg() != null) {
//			// 기존 이미지 삭제후 업로드
//			service.uploadProfile(file, uriPath, member);
//		} else {
//		
//	}
		// 프로필 이미지가 없다면 바로 업로드
//		service.uploadProfile(file, uriPath, member);
		fService.uploadProfile(file, uriPath, member);
		
		session.removeAttribute("user");
		Member user = service.selectMember(member.getMemberNo());
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 60);
	}
	
	// 버스커 등록 화면으로 이동
	@RequestMapping("signupform-busker.do")
	public String signupformBusker(Member member) {
		System.out.println(member.getIsBusker());
//		if(session.get != null) {
//			return "redirect:/index.jsp";
//		}
		return "main/member/signupform-busker";
	}
	
	// 버스커 등록 처리
	@RequestMapping("signup-busker.do")
	public String signupBusker(Busker busker, Member member, HttpSession session) {
		service.signupBusker(busker);
		member.setIsBusker("y");
		service.changeBuskerType(member);
		
		BuskerGenre buskerGenre = new BuskerGenre();
		buskerGenre.setBuskerNo(busker.getBuskerNo());
		buskerGenre.setBuskerCheckbox(busker.getBuskerCheckbox());
		service.insertBuskerGenre(buskerGenre);
		
		session.removeAttribute("user");
		Member user = service.selectMember(member.getMemberNo());
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 60);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "setting.do";
	}
	
	// 회원 결제 충전
	@RequestMapping("charge-money.do")
	@ResponseBody
	public void chargeMoney(Member member,  HttpSession session) {
//		System.out.println(member.getSum()+"컨트롤러들어옴");
		service.chargeMoney(member);
		
		session.removeAttribute("user");
		Member user = service.selectMember(member.getMemberNo());
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 60);
	}
	
	// 회원 정보 업데이트
	@RequestMapping("userInfoUpdate.do")
	public String memberUpdate(Member member,HttpSession session) {
		String inputPass = member.getPass();
		String pass = passEncoder.encode(inputPass);
		member.setPass(pass);
		service.updateMember(member);
		session.removeAttribute("user");
		Member user = service.selectMember(member.getMemberNo());
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 60);
		return "main/member/setting";
	}
}
