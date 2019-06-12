package kr.co.buskers.artist.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.common.page.VideoPageResult;
import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Genre;
import kr.co.buskers.repository.domain.Video;
import kr.co.buskers.repository.domain.VideoPage;
import kr.co.buskers.repository.mapper.AgencyMapper;
import kr.co.buskers.repository.mapper.ArtistBoardMapper;

@Service
public class ArtistBoardServiceImpl implements ArtistBoardService {
	
	@Autowired
	private ArtistBoardMapper mapper;
	
	@Autowired
	private AgencyMapper aMapper;
	
	@Override
	public void insertArtistShow(ArtistShow artistShow) {
		mapper.insertArtistShow(artistShow);
	}
	
	@Override
	public List<Genre> selectGenre() {
		return aMapper.selectGenre();
	}
	
	@Override
	public List<ArtistShow> selectArtistShow(int buskerNo){
		return mapper.selectArtistShow(buskerNo);
	}
	
	@Override
	public ArtistShow selectArtistShowByNo(int showNo) {
		return mapper.selectArtistShowByNo(showNo);
	}
	
	@Override
	public void updateArtistShowByNo(ArtistShow artistShow) {
		mapper.updateArtistShowByNo(artistShow);
	}
	
	@Override
	public void updateWeather(ArtistShow artistShow) {
		mapper.updateArtistShowWeather(artistShow);
	}
	
	@Override
	public void deleteArtistShowByNo(int showNo) {
		mapper.deleteArtistShowByNo(showNo);
	}

	@Override
	public void insertVideo(Video video) {
		mapper.insertVideo(video);
	}

	@Override
	public HashMap<String,Object> selectVideo(int buskerNo,VideoPage videoPage) {
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("buskerNo", buskerNo);
		map.put("pageNo", videoPage.getPageNo());
		map.put("begin",videoPage.getBegin());
		
		HashMap<String,Object> rMap = new HashMap<>();
		
		rMap.put("pageResult",(VideoPageResult)new VideoPageResult(videoPage.getPageNo(),mapper.countVideo(buskerNo)));
		rMap.put("list", (List<Video>)mapper.selectVideo(map));
		
		
		return rMap;
	}

	@Override
	public void deleteVideo(int videoNo) {
		mapper.deleteVideo(videoNo);
		
	}
}
