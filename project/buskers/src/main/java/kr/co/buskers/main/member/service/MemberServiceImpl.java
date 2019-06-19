package kr.co.buskers.main.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.common.page.FreePageResult;
import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.BuskerGenre;
import kr.co.buskers.repository.domain.Follow;
import kr.co.buskers.repository.domain.FollowList;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Member;
import kr.co.buskers.repository.mapper.BuskerMapper;
import kr.co.buskers.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BuskerMapper bmapper;
	
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
	@Override
	public void signupSocialMember(Member member) {
		mapper.signupSocialMember(member);
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

	// 비밀번호 찾기
	@Override
	public Member findPass(Member member) {
		return mapper.findPass(member);
	}
	
	// 비밀번호 변경
	@Override
	public void newPass(Member member) {
		mapper.newPass(member);
	}


	public void updateNickNameSocialMember(Member member) {
		mapper.updateNickNameSocialMember(member);
	}


	
	
	
	// 돈 충전
	@Override
	public void chargeMoney(Member member) {
		mapper.chargeMoney(member);
	}


	// 개인정보 업데이트
	@Override
	public void updateMember(Member member) {
		mapper.memberUpdate(member);
	}


	@Override
	public Member selectMember(int memberNo) {
		
		return mapper.selectUser(memberNo);
	}

	// 버스커 등록
	@Override
	public void signupBusker(Busker busker) {
		mapper.signupBusker(busker);
		
	}

	// 버스커 타입 변경
	@Override
	public void changeBuskerType(Member member) {
		mapper.changeBuskerType(member);
	}

	// 버스커 장르 등록
	@Override
	public void insertBuskerGenre(BuskerGenre buskerGenre) {
		mapper.insertBuskerGenre(buskerGenre);
	}

	// 활동명 중복체크
	@Override
	public int checkActivityName(Busker busker) {
		return bmapper.checkActivityName(busker);
	}

	// 버스커 업데이트
	@Override
	public void updateBusker(Busker busker, BuskerGenre buskerGenre) {
		mapper.deleteBuskerGenreByNo(busker.getBuskerNo());
		buskerGenre.setBuskerNo(busker.getBuskerNo());
		mapper.insertBuskerGenre(buskerGenre);
		mapper.updateBusker(busker);
	}
	
	
	// 프로필 소개글 업데이트
	@Override
	public void updateMemberProfileIntroduce(Member member) {
		mapper.updateMemberProfileIntroduce(member);
	}

	// 팔로우 팔로워 관리
	public Map<String, Object> followList(FollowList followList) {
		Map<String, Object> map = new HashMap<>();
		map.put("followMember", mapper.selectFollowMember(followList));
		map.put("followerMember", mapper.selectFollowerMember(followList));
		return map;
	}
	@Override
	public Map<String, Object> followCount(Follow follow) {
		Map<String, Object> map = new HashMap<>();
		map.put("followCount", mapper.selectFollowCount(follow));
		map.put("followerCount", mapper.selectFollowerCount(follow));
		return map;
	}

	// 팔로우 취소
	@Override
	public int followCancel(Follow follow) {
		int con = mapper.confirmFollow(follow);
		if(con == 1) {
			String followStatus = mapper.followStatus(follow);
			//팔로우가 y일경우에 팔로우처리, 0리턴
			if(followStatus.equals("y")) {
				mapper.followCancle(follow);
			}
		}
		return 0;
	}


	



	
}
