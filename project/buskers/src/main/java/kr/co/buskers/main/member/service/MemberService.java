package kr.co.buskers.main.member.service;

import kr.co.buskers.repository.domain.Member;

public interface MemberService {
	
	// 로그인 체크
	public Member login(Member member);
	
	// 일반 회원 가입
	public void signupMember(Member member);
	public void signupSocialMember(Member member);

	// 아이디 중복 체크
	public int checkId(Member member);

	public int checkEmail(Member member);

	public int checkNickName(Member member);

	public Member findId(Member member);
}
