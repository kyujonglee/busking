package kr.co.buskers.main.member.service;

import java.util.Map;

import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.BuskerGenre;
import kr.co.buskers.repository.domain.Follow;
import kr.co.buskers.repository.domain.FollowList;
import kr.co.buskers.repository.domain.Member;

public interface MemberService {
	
	// 로그인 체크
	public Member login(Member member);
	
	// 정보변경시 세션 재접속을 위한 기능
	public Member selectMember(int memberNo);

	// 일반 회원 가입
	public void signupMember(Member member);
	public void signupSocialMember(Member member);
	public void updateNickNameSocialMember(Member member);
	
	// 버스커 등록
	public void signupBusker(Busker busker);
	// 버스커 타입 변경
	public void changeBuskerType(Member member);
	// 버스커 장르 등록
	public void insertBuskerGenre(BuskerGenre buskerGenre);
	
	
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
	
	// 개인정보 업데이트
	public void updateMember(Member member);
	
	// 활동명 중복 체크
	public int checkActivityName(Busker busker);

	// 버스커 정보 업데이트
	public void updateBusker(Busker busker, BuskerGenre buskerGenre);

	// 프로필 소개글 업데이트
	public void updateMemberProfileIntroduce(Member member);

	// 팔로우 정보 리스트
	public Map<String, Object> followList(FollowList followList);
	public Map<String, Object> followCount(Follow follow);



	

}
