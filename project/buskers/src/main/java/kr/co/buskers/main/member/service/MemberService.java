package kr.co.buskers.main.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import kr.co.buskers.repository.domain.Member;

public interface MemberService {
	
	// 로그인 체크
	public Member login(Member member);
	
	// 일반 회원 가입
	public void signupMember(Member member);
	public void signupSocialMember(Member member);
	public void updateNickNameSocialMember(Member member);

	// 아이디 중복 체크
	public int checkId(Member member);
	
	// 이메일 중복 체크
	public int checkEmail(Member member);

	// 닉네임 중복 체크
	public int checkNickName(Member member);

	// 아이디 찾기
	public Member findId(Member member);

	// 비밀번호 찾기
	public Member findPass(Member member);
	
	// 비밀번호 변경
	public void newPass(Member member);

	// 프로필 이미지 업로드
	public Member uploadProfile(MultipartFile multipartFile, String uriPath, HttpSession session) throws Exception;
	
	// 돈 충전
	public void chargeMoney(Member member);
	
	// 개인정보 업데이트
	public void updateMember(Member member);
	
	public Member selectMember(int memberNo);

}
