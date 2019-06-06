package kr.co.buskers.artist.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.MusicFile;
import kr.co.buskers.repository.mapper.ArtistBoardMapper;
import kr.co.buskers.repository.mapper.FileMapper;

@Service
public class ArtistMainServiceImpl implements ArtistMainService {
	
	@Autowired
	private ArtistBoardMapper boardMapper;
	
	@Autowired
	private FileMapper mMapper;
	
	@Autowired
	private FileMapper fMapper;
	
	@Override
	public Map<String,Object> artistMain(int buskerNo) {
		Map<String,Object> boardMap = new HashMap<>();
		boardMap.put("showCount", boardMapper.countArtistCurrentShow() );
		boardMap.put("musicCount", fMapper.countMusic(1) );
		return boardMap;
	}
	
	@Override
	public List<MusicFile> selectMusicByBuskerNo(int buskerNo){
		return fMapper.selectMusicByBuskerNo(buskerNo);
	}
	
}
