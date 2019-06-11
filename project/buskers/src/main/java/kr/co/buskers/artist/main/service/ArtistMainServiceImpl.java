package kr.co.buskers.artist.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.Busker;
import kr.co.buskers.repository.domain.Follow;
import kr.co.buskers.repository.domain.MusicFile;
import kr.co.buskers.repository.domain.SocialUrl;
import kr.co.buskers.repository.mapper.ArtistBoardMapper;
import kr.co.buskers.repository.mapper.FileMapper;
import kr.co.buskers.repository.mapper.MemberMapper;

@Service
public class ArtistMainServiceImpl implements ArtistMainService {
	
	@Autowired
	private ArtistBoardMapper boardMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private FileMapper fMapper;
	
	@Override
	public Map<String,Object> artistMain(int buskerNo) {
		Map<String,Object> boardMap = new HashMap<>();
		boardMap.put("showCount", boardMapper.countArtistCurrentShow(buskerNo) );
		boardMap.put("musicCount", fMapper.countMusic(buskerNo) );
		return boardMap;
	}
	
	@Override
	public List<MusicFile> selectMusicByBuskerNo(int buskerNo){
		return fMapper.selectMusicByBuskerNo(buskerNo);
	}

	@Override
	public int followBusker(Follow follow) {
		int con = memberMapper.confirmFollow(follow);
		if(con == 1) {
			String followStatus = memberMapper.followStatus(follow);
			//팔로우가 y일경우에 팔로우처리, 0리턴
			if(followStatus.equals("y")) {
				memberMapper.followCancle(follow);
				
			//팔로우가 n일경우에 팔로우처리, 1리턴
			}else if(followStatus.equals("n")) {
				memberMapper.follow(follow);
				return 1;
			}
			
		// con이 1 이외 일 경우 인서트로 팔로우 db에 생성
		}else {
			memberMapper.insertFollow(follow);
			return 1;
		}
		
		return 0;
	}

	@Override
	public String followBuskerStatus(Follow follow) {
		return memberMapper.followStatus(follow);
	}

	@Override
	public void sociaUrlInsert(SocialUrl socialUrl) {
		int con = boardMapper.countSocialUrl(socialUrl);
		if(con == 1) {
			boardMapper.updateSocialUrl(socialUrl);
		}else {
			boardMapper.insertSocialUrl(socialUrl);
		}
	}

	@Override
	public SocialUrl selectSocialUrl(int buskerNo) {
		return boardMapper.selectSocialUrl(buskerNo);
	}

	@Override
	public void updateIntro(Busker busker) {
		memberMapper.updateIntro(busker);		
	}

	@Override
	public Busker selectBusker(int buskerNo) {
		return memberMapper.selectBusker(buskerNo);
	}
	
}
