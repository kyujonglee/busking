package kr.co.buskers.repository.mapper;

import kr.co.buskers.repository.domain.Member;

public interface MemberMapper {
	
	// 로그인 체크
	public Member loginAction(Member member);

	// 일반 회원 가입
	public void signupMember(Member member);
	
	//소셜 회원가입
	public void signupSocialMember(Member member);
	
	//소셜 회원가입 닉네임 업데이트
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
	
	// 돈 충전
	public void chargeMoney(Member member);
	
	// 멤버 업데이트
	public void memberUpate(Member member);
}
