package kr.co.buskers.main.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.Member;
import kr.co.buskers.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	// 로그인 체크
	@Override
	public Member login(Member member) {
		return mapper.loginAction(member);
	}
	
	
	// 회원가입 처리
	@Override
	public void signupMember(Member member) {
		mapper.signupMember(member);
	}


	// 아이디 중복 체크
	@Override
	public int checkId(Member member) {
		return mapper.checkId(member);
	}

	// 이메일 중복 체크
	@Override
	public int checkEmail(Member member) {
		return mapper.checkEmail(member);
	}

	// 닉네임 중복 체크
	@Override
	public int checkNickName(Member member) {
		return mapper.checkNickName(member);
	}


	// 아이디 찾기
	@Override
	public Member findId(Member member) {
		return mapper.findId(member);
	}
	
	
	
	
	
	
	
}
