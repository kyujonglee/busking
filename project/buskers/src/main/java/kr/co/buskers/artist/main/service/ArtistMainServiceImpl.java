package kr.co.buskers.artist.main.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.mapper.ArtistBoardMapper;

@Service
public class ArtistMainServiceImpl implements ArtistMainService {
	
	@Autowired
	private ArtistBoardMapper boardMapper;
	
	@Override
	public Map<String,Object> artistMain() {
		Map<String,Object> boardMap = new HashMap<>();
		boardMap.put("showCount", boardMapper.countArtistCurrentShow() );
		return boardMap;
	}
	
}
