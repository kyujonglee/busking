package kr.co.buskers.repository.mapper;

import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.Follow;
import kr.co.buskers.repository.domain.Member;

public interface MemberMapper {
	
	// 로그인 체크
	public Member loginAction(Member member);

	// 로그인 체크
	public Member buskerLoginAction(Member member);

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
	public void memberUpdate(Member member);
	
	public Member selectUser(int memberNo);
	
	// 프로필 이미지 업데이트
	public void uploadProfile(Member member);

	// 버스커 등록
	public void signupBusker(Busker busker);

	// isBusker 변경
	public void changeBuskerType(Member member);
	
	
	//팔로우 테이블 있는지
	public int confirmFollow(Follow follow);
	
	//팔로우 테이블 생성
	public void insertFollow(Follow follow);
	
	//팔로우상태 알아오기
	public String followStatus(Follow follow);
	
	//팔로우 취소
	public void followCancle(Follow follow);
	
	//팔로우
	public void follow(Follow follow);
	
	//버스커 인트로
	public void updateIntro(Busker busker);
	
	public Busker selectBusker(int buskerNo);
	
	
	
	
}
