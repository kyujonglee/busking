package kr.co.buskers.repository.mapper;

import kr.co.buskers.repository.domain.Member;

public interface MemberMapper {
	
	// 로그인 체크
	public Member loginAction(Member member);
	

	// 일반 회원 가입
	public void signupMember(Member member);
	
	// 아이디 중복 체크
	public Member checkId(Member member);
	
}
