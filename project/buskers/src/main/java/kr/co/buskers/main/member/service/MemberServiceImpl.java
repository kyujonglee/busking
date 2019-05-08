package kr.co.buskers.main.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.Member;
import kr.co.buskers.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	public void signup(Member member) {
		mapper.signupMember(member);
	}
}
