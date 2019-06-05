package kr.co.buskers.main.member.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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


	@Override
	public Member uploadProfile(MultipartFile multipartFile, String uriPath, HttpSession session) throws Exception {
		UUID uuid = UUID.randomUUID();
		String uploadRoot = "C:/bit2019/upload";
		String path = uriPath + session.getId() + "/";
		String orgFileName = multipartFile.getOriginalFilename();
		String sysFileName = uuid.toString() + orgFileName;
		String filePath = uploadRoot + path;
		
		Member member = new Member();
		member.setProfileImg(multipartFile.getOriginalFilename());
		member.setProfileImgPath(filePath);
		
		File f = new File(filePath + sysFileName);
		
		System.out.println(filePath + sysFileName);
		
	    if(f.exists() == false) {
    	  f.mkdirs();
	    }
	    
	    multipartFile.transferTo(f);
		
		return member;
	}
	
	
	// 돈 충전
	@Override
	public void chargeMoney(Member member) {
		mapper.chargeMoney(member);
	}


	// 개인정보 업데이트
	@Override
	public void updateMember(Member member) {
		System.out.println(member.getMemberNo());
		System.out.println(member.getEmail());
		System.out.println(member.getNickName());
		System.out.println(member.getPass());
		mapper.memberUpate(member);
	}


	@Override
	public Member selectMember(int memberNo) {
		
		return mapper.selectUser(memberNo);
	}
	
}
