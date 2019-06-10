package kr.co.buskers.artist.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.domain.Genre;
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
}
