package kr.co.buskers.main.info.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.Video;
import kr.co.buskers.repository.mapper.ArtistBoardMapper;
import kr.co.buskers.repository.mapper.BuskerMapper;
import kr.co.buskers.repository.mapper.FileMapper;

@Service
public class InfoServiceImpl implements InfoService{
	
	@Autowired
	private BuskerMapper bMapper;
	
	@Autowired
	private FileMapper fMapper;
	
	@Autowired
	private ArtistBoardMapper abMapper;
	
	@Override
	public Map<String,Object> list() {
		Map<String, Object> map = new HashMap<>();
		map.put("buskerList", bMapper.selectBusker());
		map.put("musicList", fMapper.selectMusicLimit());
		return map;
	}
	
	@Override
	public List<Video> videoList(){
		return abMapper.selectVideoLimit();
	}
	
	@Override
	public List<Video> videoItem(int buskerNo){
		return abMapper.selectVideoLimitByNo(buskerNo);
	}
	
	@Override
	public Video videoONE(int buskerNo){
		return abMapper.selectVideoOneByNo(buskerNo);
	}
}
