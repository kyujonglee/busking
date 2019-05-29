package kr.co.buskers.artist.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.ArtistShow;
import kr.co.buskers.repository.mapper.ArtistBoardMapper;

@Service
public class ArtistBoardServiceImpl implements ArtistBoardService {
	
	@Autowired
	private ArtistBoardMapper mapper;
	
	@Override
	public void insertArtistShow(ArtistShow artistShow) {
		mapper.insertArtistShow(artistShow);
	}
	
	@Override
	public List<ArtistShow> selectArtistShow(){
		return mapper.selectArtistShow();
	}
}
